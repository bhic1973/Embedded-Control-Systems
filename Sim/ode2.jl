import Pkg
Pkg.activate("/home/codespace/Sim") 

import DifferentialEquations as DE
using Plots
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

plot(sol, idxs=[:y],
 xlabel=L"t\ (s)", 
 ylabel="", lw=2, 
 legend=:topright, 
 label=L"y\ (m)", 
 title="Mass-Spring-Damper System Response",
 size=(800,400))