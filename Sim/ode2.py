#!/usr/bin/env python

from diffeqpy import de 
from matplotlib import pyplot as plt 
import numpy as np 

def r(t): 
    return de.ifelse(t==0,1.0,0.0)

def ode2(u,p,t):
    m, b, k = p
    y, z = u 
    return [z,-b/m * z - k/m * y + 100*r(t)/m]

zeta = 0.25
wn = 1.0
m = 1.0
p = (m,2*zeta*wn**2*m,wn**2*m)
u0 = [1.0,0.0]
tspan = (0.0,100.0)

prob = de.jit(de.ODEProblem(ode2,u0,tspan,p))

integrator = de.init(prob,de.Vern9(),saveat=0.1)
integrator.opts.abstol = 1e-9
integrator.opts.reltol = 1e-9
de.step_b(integrator,100.0) 

sol = integrator.sol


y = de.transpose(de.stack(sol.u))[:,0]
tt = sol.t 

fig = plt.figure()
ax = fig.add_subplot(111)

ax.plot(tt, y, label=r'$y(t)$')
ax.set_xlabel('Time [s]')
ax.set_ylabel(r'$y(t)')

ax.legend()
ax.grid()
fig.tight_layout()

plt.show()


