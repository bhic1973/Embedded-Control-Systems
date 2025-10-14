# import Pkg
# Pkg.activate(@__DIR__) 

import DifferentialEquations as DE
import CairoMakie as CM
using ModelingToolkit
using ModelingToolkit: t_nounits as t, D_nounits as D 
using LaTeXStrings

@mtkmodel ODE2 begin
    @parameters begin
        M = 1000.0
        b = 200.0
        k = 20000.0
    end
    @variables begin
        y(t) = 0.0
        z(t) = 0
        r(t)
    end
    @equations begin
        r ~ ifelse(t > 0.0, k, 0.0)
        D(y) ~ z
        D(z) ~ -b/M * z - k/M * y + r/M
    end
end

@mtkcompile ode2 = ODE2()

u0 = []
p = []
tspan = (0.0, 100.0)

prob = DE.ODEProblem(ode2,
 merge(
    if isempty(u0)
        Dict()
    else
        u0
    end,if isempty(p)
        Dict()
    else
        p
    end
 ), tspan)

sol = DE.solve(prob, DE.Tsit5(), abstol=1e-8, reltol=1e-6)

fig = CM.Figure(;size = (800, 400));
ax = fig[1, 1] = CM.Axis(fig; xlabel = L"t\ (s)", ylabel = L"y\ (m)", title = "Mass-Spring-Damper System Response")
CM.lines!(ax, sol.t, sol[:y], color = :blue, label = L"y\ (m)", linewidth = 2)
CM.axislegend(ax; position = :rt)    
fig
