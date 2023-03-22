1032201738%70+1

using Plots
using DifferentialEquations

a = 0.7
b = 0.00051
N = 1210

tmax = 6
tspan = (0, tmax)
t = collect(LinRange(0, tmax, 500))
n = 13

function syst(dy, y, p, t)
    dy[1] = (a+b*y[1])*(N-y[1])
end

prob = ODEProblem(syst, [n], tspan)
sol = solve(prob, saveat = t)

plot(sol)

savefig("04.png")

a = 0.00004
b = 0.75
N = 1210

tmax = 0.02
tspan = (0, tmax)
t = collect(LinRange(0, tmax, 500))
n = 13

function syst(dy, y, p, t)
    dy[1] = (a+b*y[1])*(N-y[1])
end

prob = ODEProblem(syst, [n], tspan)
sol = solve(prob, saveat = t)

plot(sol)

savefig("05.png")

a = 0.75
b = 0.35
N = 1210

tmax = 0.02
tspan = (0, tmax)
t = collect(LinRange(0, tmax, 500))
n = 13

function syst(dy, y, p, t)
    dy[1] = (a*sin(0.5*t)+b*cos(0.6*t)*y[1])*(N-y[1])
end

prob = ODEProblem(syst, [n], tspan)
sol = solve(prob, saveat = t)

plot(sol)

savefig("06.png")


