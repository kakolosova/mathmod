1032201738%70+1

using Plots
using DifferentialEquations

p_cr=21
N=24
q=1
tau1=17
tau2=20
p1=14
p2=12
d=0.0018

M1=2.6
M2=1.9

a1=p_cr/(tau1*tau1*p1*p1*N*q)
a2=p_cr/(tau2*tau2*p2*p2*N*q)
b=p_cr/(tau1*tau1*p1*p1*tau2*tau2*p2*p2*N*q)
c1=(p_cr-p1)/(tau1*p1)
c2=(p_cr-p2)/(tau2*p2)

t = collect(LinRange(0, 20, 500))
    
tspan = (0, 20)

function syst(dy, y, p, t)
    dy[1] = y[1] - (b/c1)*y[1]*y[2] - (a1/c1)*y[1]*y[1]
    dy[2] = (c2/c1)*y[2] - (b/c1)*y[1]*y[2] - (a2/c1)*y[2]*y[2]
end

prob = ODEProblem(syst, [M1, M2], tspan)
sol = solve(prob, saveat = t)

plot(sol)

savefig("03.png")

function syst(dy, y, p, t)
    dy[1] = y[1] - (b/c1+d)*y[1]*y[2] - (a1/c1)*y[1]*y[1]
    dy[2] = (c2/c1)*y[2] - (b/c1)*y[1]*y[2] - (a2/c1)*y[2]*y[2]
end

prob = ODEProblem(syst, [M1, M2], tspan)
sol = solve(prob, saveat = t)

plot(sol)

savefig("04.png")


