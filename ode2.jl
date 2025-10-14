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
        y(t) = 5.0
        z(t) = 0
        r(t)
    end
    @equations begin
        r ~ ifelse(t < 0.0, 1.0, 0.0)
        D(y) ~ z
        M*D(z) ~ -b*z - k*y + r
    end
end

@mtkcompile ode2 = ODE2()

tspan = (0.0, 30.0)
prob = De.ODEPRoblem(ode2, [], tspan, [])

sol = De.solve(prob, Tsit5(), abstol=1e-8, reltol=1e-6)

plot(sol, vars=[y, z], xlabel=L"t\ (s)", ylabel="", lw=2, legend=:topright, label=[L"y\ (m)" L"z\ (\frac{m}{s})"], title="Mass-Spring-Damper System Response", size=(800,400))