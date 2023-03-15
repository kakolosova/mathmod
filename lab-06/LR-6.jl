using Plots
using DifferentialEquations

1032201738%70+1

N = 15500
I = 115
R = 15
S = N-I-R

tspan = (0, 300)
t = collect(LinRange(0, 100, 1000))
u0 = [S; I; R]

a = 0.07
b = 0.03

function syst(dy, y, p, t)
    dy[1] = 0
    dy[2] = b*y[2]
    dy[3] = -b*y[2]
end

prob = ODEProblem(syst, u0, tspan)
sol = solve(prob, saveat = t)

plot(sol)

savefig("03.png")

function syst(dy, y, p, t)
    dy[1] = -a*y[1]
    dy[2] = a*y[1]-b*y[2]
    dy[3] = b*y[2]
end

prob = ODEProblem(syst, u0, tspan)
sol = solve(prob, saveat = t)

plot(sol)

savefig("04.png")


