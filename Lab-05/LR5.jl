1032201738%70+1

using Plots
using DifferentialEquations

x0 = 14
y0 = 9
u0 = [x0; y0]

t0 = 0
tmax = 120
tspan = (t0, tmax)
t = collect(LinRange(t0, tmax, 1000))
    
a = 0.21
b = 0.049
c = 0.41
d = 0.037

function syst(dy, y, p, t)
    dy[1] = -a*y[1] + b*y[1]*y[2]
    dy[2] = c*y[2] - d*y[1]*y[2]
end

prob = ODEProblem(syst, u0, tspan)

sol = solve(prob, saveat = t)

plot(sol)

savefig("03.png")

plot(sol, idxs=(1,2))

savefig("04.png")


