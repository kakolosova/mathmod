1032201738%70+1

using Plots
using DifferentialEquations

s = 6.7
n = 2.7

fi = 3*pi/4

function f(r, p, t)
    dr = r/sqrt(n^2-1)
    return dr
end

function f2(t)
    xt = tan(fi+pi)*t
    return xt
end

r0 = s/(n+1)

tetha0 = collect(LinRange(0, 2*pi, 200))
prob = ODEProblem(f, r0, (0, 2*pi))
sol = solve(prob, saveat = tetha0)

t = collect(LinRange(0, 12, 200))
r1 = []
tetha1 = []
for i in t
    push!(r1, sqrt(i^2 + f2(i)^2))
    push!(tetha1, atan(f2(i)/i))
end
    
plot(sol, proj=:polar, label="катер")
plot!(tetha1, r1, proj=:polar, label="лодка")

r0 = s/(n-1)

tetha0 = collect(LinRange(0, 2*pi, 200))
prob = ODEProblem(f, r0, (0, 2*pi))
sol = solve(prob, saveat = tetha0)

t = collect(LinRange(0, 30, 200))
r1 = []
tetha1 = []
for i in t
    push!(r1, sqrt(i^2 + f2(i)^2))
    push!(tetha1, atan(f2(i)/i))
end
    
plot(sol, proj=:polar, label="катер")
plot!(tetha1, r1, proj=:polar, label="лодка")


