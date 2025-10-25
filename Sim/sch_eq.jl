using MethodOfLines, ModelingToolkit, CairoMakie, DomainSets, LaTeXStrings
using DifferentialEquations:OrdinaryDiffEq 
using ModelingToolkit: t_nounits as t, D_nounits as Dt

@parameters x
@variables   u(..) [guess=0]

Dxx = Differential(x)^2

xmin, xmax = (0.0,1.0)
V(x) = 0.0

eq = [
  1im*Dt(u(t,x)) - Dxx(u(t,x)) - V(x)*u(t,x) ~ 0
]

u0 = x->sin(2pi*x)

bcs = [
  u(0,x) ~ u0(x)+0im,
  u(t,xmin) ~ 0+0im,
  u(t,xmax) ~ 0+0im
]

domains = [t in Interval(0,1), x in Interval(xmin,xmax)]

@named pdesys = PDESystem(eq, bcs, domains, [t, x],[u(t,x)])

disc = MOLFiniteDifference([x=>64],t,approx_order=2)

# prob = discretize(pdesys, disc)

# sol = solve(prob, TRBDF2(), saveatt=0.01)





