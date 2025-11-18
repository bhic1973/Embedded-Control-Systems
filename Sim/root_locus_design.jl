### A Pluto.jl notebook ###
# v0.20.21

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    return quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ ed0f1376-c251-11f0-b62b-c700a1e03d87
begin
	import Pkg
	Pkg.activate(pwd())
end

# ╔═╡ af6a55fd-feb4-40ba-989c-3181ef98ff2f
begin
	import CairoMakie as CM
	import ControlSystems as CS
	import Symbolics as Sym
	import ModelingToolkit as MTK
	using NonlinearSolve
	using LaTeXStrings
	using PlutoUI
	using Nemo
end

# ╔═╡ 3f6e4d49-1b04-4354-9339-20831554a7a9


# ╔═╡ 2da446c1-11fc-40d7-8da6-59bbaf10f9fb
begin
	s = CS.tf('s')
	Hα = 1/(s^2 * (s+1))
	Hα
end

# ╔═╡ d7a23224-a197-441d-aaba-15b5baf6eaea
begin
	rl_α = CS.rlocus(Hα);
end

# ╔═╡ e3fae4a1-0405-49c6-9ee4-db0284f984b6
let
	fig = CM.Figure()
	ax = CM.Axis(fig[1,1],
				 xlabel="Real",
				 ylabel="Imag",
				 title=L"$\mathrm{Root\; locus\; according\; to\; }\alpha$",
				 yaxisposition=:right,
				)
	rs = @view rl_α.roots[:,:]
	for k in 1:3 
		CM.lines!(ax,real.(rs[:,k]),imag.(rs[:,k]),
				  color=:blue
				 )
		CM.scatter!(ax,real(rs[1,k]),imag(rs[1,k]),
					marker=:x,
					markersize=16,
					color=:red
				   )
	end
	CM.hidespines!(ax,:l,:t)
	# CM.ylims!(ax,-5,5)
	#CM.hideydecorations!(ax)
	fig
end

# ╔═╡ 2dd48de9-222e-4b47-b0b4-ba06a848d406
@bind α Slider(collect(0:0.25:25),default=0.0,show_value=true)

# ╔═╡ 16918f52-5dc9-4252-9d8c-ac6adae61419
begin
	Hβ = s / (s^3 + s^2 + α)
	rl_β = CS.rlocus(Hβ)
	Hβ
end

# ╔═╡ 655c964b-0560-45cc-970f-ee832fd905c8
let
	fig = CM.Figure()
	ax = CM.Axis(fig[1,1],
				 xlabel="Real",
				 ylabel="Imag",
				 title="Root locus according to β",
				 yaxisposition=:right,
				 yminorgridvisible=true
				)
	rs = @view rl_β.roots[:,:]
	label = L"$\alpha=$ %$(round(α,digits=3))"
	for k in 1:3
		CM.scatter!(ax,real(rs[1,k]),imag(rs[1,k]),
					marker=:x,
					markersize=16,
					color=:red
				   )
	
		CM.lines!(ax,real.(rs[:,k]),imag.(rs[:,k]),
				color=:blue,
				label= k==3 ? label : nothing
				)
	end
	CM.hidespines!(ax,:l,:t)
	CM.axislegend(ax;position=:lt)
	CM.ylims!(ax,-10,10)
	# CM.ylims!(ax,-5,5)
	#CM.hideydecorations!(ax)
	fig
end

# ╔═╡ a109553b-4f35-4cf7-8558-4c0a40ea99a6
CS.margin(Hβ)

# ╔═╡ d75de72d-1d02-4528-9e23-7b770857d3bb
let αp = α
	MTK.@variables s
	MTK.@parameters α = αp
	Ds = MTK.Differential(s)
	P(s) = s / (s^3 + s^2 + α)
	dK = MTK.expand_derivatives(Ds(-1/P(s)))
	Eq = [0 ~ dK]
	MTK.@mtkcompile nlsys = MTK.NonlinearSystem([0 ~ dK],[s],[α])
	prob = NonlinearProblem(nlsys,[1.0])
	sol = MTK.solve(prob,NewtonRaphson())
	println(sol[:s])
end

# ╔═╡ Cell order:
# ╠═ed0f1376-c251-11f0-b62b-c700a1e03d87
# ╠═af6a55fd-feb4-40ba-989c-3181ef98ff2f
# ╠═3f6e4d49-1b04-4354-9339-20831554a7a9
# ╠═2da446c1-11fc-40d7-8da6-59bbaf10f9fb
# ╟─d7a23224-a197-441d-aaba-15b5baf6eaea
# ╟─e3fae4a1-0405-49c6-9ee4-db0284f984b6
# ╠═2dd48de9-222e-4b47-b0b4-ba06a848d406
# ╟─16918f52-5dc9-4252-9d8c-ac6adae61419
# ╟─655c964b-0560-45cc-970f-ee832fd905c8
# ╠═a109553b-4f35-4cf7-8558-4c0a40ea99a6
# ╠═d75de72d-1d02-4528-9e23-7b770857d3bb
