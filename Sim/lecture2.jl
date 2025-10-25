begin
    import Pkg
    Pkg.activate(".")
    Pkg.status()
end

begin
    using ModelingToolkit
    using DifferentialEquations
    import CairoMakie as CM
    using LaTeXStrings
    using ModelingToolkit:Symbolics 
    using ModelingToolkit: t_nounits as t, D_nounits as D
end

# parameters ------
ps = @parameters begin
    r₀ = 876.0 # kg/m³
    g = 9.81 # m/s²
    β = 1.2e9 # Pa
    A = 1.0e-2 # m²
    x₀ = 1.0 # m
    M = 10_000  # kg
    amp = 5e-2 # m
    ω = 2pi*15 # rad/s
end

begin
    dt = 1e-4 # s
    t_end = 0.2 # s
    tspan = (0.0, t_end)
    tsteps = 0.0:dt:t_end
end

x_func(t,amp,ω) = x₀ + amp*sin(ω*t)
ẋ_func = build_function(expand_derivatives(D(x_func(t,amp,ω))),t,amp,ω, expression=false)

vars = @variables begin
    x(t) = x₀
    ẋ(t)
    ẍ(t)
    p(t) = M * g / A
    ṁ(t)
    r(t)
    ṙ(t) 
end

function get_base_equations(density_type)
    [
        D(x) ~ ẋ
        D(ẋ) ~ ẍ
        D(r) ~ ṙ
        r ~ r₀*(1 + p /β)
        ṁ ~ A * r * ẋ + (density_type) * ẋ * A
        M * ẍ ~ A * p - M * g
    ]     
end

# Case 1
eqs_ṁ1 = [
    get_base_equations(r₀)...
    ṁ ~ ẋ_func(t,amp,ω) * A * r 
]

# Case 2
eqs_ṁ2 = [
    get_base_equations(r)...
    ṁ ~ ẋ_func(t,amp,ω) * A * r 
]

# Case 3
eqs_x = [
    get_base_equations(r)...
    x ~ x_func(t,amp,ω)
]

@mtkbuild odesys_x = ODESystem(eqs_x, t, vars, ps)

u0 = []
p0 = []

prob_x = ODEProblem(odesys_x, merge(
    if isempty(u0)
        Dict()
    else
        u0  
    end, if isempty(p0)
        Dict()
    else
        p0  
    end),tspan)

sol_x = solve(prob_x, saveat=dt);

let
    fig = CM.Figure(size = (800, 600));
    ax = CM.Axis(fig[1,1], xlabel = L"t\ (s)", ylabel = L"\dot{m}\ (\mathrm{Kg/s})", title = "Mass rate vs Time")
    CM.lines!(ax, sol_x, idxs=:ṁ, color = :blue, label = L"\dot{m}\ with\ x(t)")
    CM.axislegend(ax, position = :rt)
    fig
end

@mtkbuild odesys_ṁ1 = ODESystem(eqs_ṁ1, t, vars, ps)
observed(odesys_ṁ1) 

u0 =Dict([s=>sol_x[s][1] for s in unknowns(odesys_ṁ1)])
prob_ṁ1 = ODEProblem(odesys_ṁ1, merge(
    if isempty(u0)
        Dict()
    else
        u0  
    end, if isempty(p0)
        Dict()
    else
        p0  
    end),tspan)

@time sol_ṁ1 = solve(prob_ṁ1, initializealg=NoInit(), saveat=dt);

let
    fig = CM.Figure(size = (800, 600));
    ax = CM.Axis(fig[1,1], xlabel = L"t\ (s)", ylabel = L"\dot{m}\ (\mathrm{Kg/s})", title = "Mass rate vs Time")
    CM.scatter!(ax, sol_ṁ1, idxs=:ṁ, marker=:x, markersize=10, color = :blue, label = "guess")
    CM.lines!(ax, sol_x, idxs=:ṁ, color = :red, label = "solution")
    CM.axislegend(ax, position = :rt)
    fig
end

begin
    @mtkbuild odesys_ṁ2 = ODESystem(eqs_ṁ2, t, vars, ps)
    observed(odesys_ṁ2)

    prob_ṁ2 = ODEProblem(odesys_ṁ2, merge(
        if isempty(u0)
            Dict()
        else
            u0  
        end, if isempty(p0)
            Dict()
        else
            p0  
        end),tspan
    )
    @time sol_ṁ2 = solve(prob_ṁ2, initializealg=NoInit())
end

let
    fig = CM.Figure(size = (800, 600));
    ax = CM.Axis(fig[1,1], xlabel = L"t\ (s)", ylabel = L"x", title = "x (m)")
    CM.lines!(ax,sol_x, idxs=:x, color = :blue, label = L"x")
    CM.lines!(ax,sol_ṁ1, idxs=:x, color = :green, label = L"\text{case 1: }r_0")
    CM.lines!(ax,sol_ṁ2, idxs=:x, color = :red, label = L"\text{case 2: }r(t)")
    CM.axislegend(ax, position = :rt)
    fig
end
