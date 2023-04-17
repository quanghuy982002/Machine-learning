### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 8bbca1c0-bcae-11ed-3ea1-5fe818f56ccb
using DelimitedFiles

# ╔═╡ 0195cc47-10c6-460d-9d1f-695d9fcd9593
using Statistics

# ╔═╡ fd66603b-24d4-493e-a09f-e66666fc3999
irisPath = "/Users/luuqu/OneDrive/Desktop/ML/iris-train.txt"

# ╔═╡ ae6b7b57-47b6-4712-b13d-4cddb5526139
A = readdlm(irisPath)

# ╔═╡ dc64c8f7-51ac-432a-8863-e2dbba57caca
function readData(path)
	A = readdlm(path)
	y = Int.(A[:,1])
	X = A[:,2:end]
	(X,y)
	
end

# ╔═╡ d77e0ada-200c-4840-84e4-be9b2dd214f3
X,y = readData(irisPath)

# ╔═╡ d49a926f-f82d-4794-9104-b1c1a0a37b13
function train(X, y)
	K = length(unique(y))
	N, D = size(X)
	μ = zeros(D,K)
	σ = zeros(D,K)
	θ = zeros(K) #prior  = P(y=k)
	for k = 1:K
		idk = (y .== k)
		Xk = X[idk, :]
		μ[:,k] = mean(Xk, dims = 1)
		σ[:,k] = std(Xk, dims = 1)
		θ[k] = sum(idk)/N
	end
	(μ, σ, θ)
end

# ╔═╡ 5d64595d-8ac8-4809-8a92-7eae41e1be27
μ, σ, θ = train(X, y)

# ╔═╡ 59deb86a-8fb9-4172-b579-c1fbef38e069
md"""
$\log P(y = k|x) = \sum_{j = 1}^D \log P(x_j|y = k) + \log P(y=k)$
$ = \sum_{j=1}^D \log(1/\sqrt{2\pi}\sigma_{jk} )$
"""

# ╔═╡ 77e20fc6-bee3-44e7-a70b-5c8dc91b54e2
u = rand(4)

# ╔═╡ 5a6e5037-4752-468c-877d-c785652bae6c
v = rand(4)

# ╔═╡ da8101fd-31fb-419b-afc5-fec10e570b72
sum((u-v) .^2)

# ╔═╡ 0aa78dca-37f1-41fc-b5ca-37af1bc1455e
function classify(μ, σ, θ, x)
	K = length(θ)
	p = zeros(K) #log posterior
	for k=1:K
		p[K] = -sum(log.(σ[:,k]) + (x - μ[:,k]) .^2 ./(2*σ[:,k] .^2)) + log(θ[k])
	end
	argmax(p)
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "f8aed8cc7ec98e25caba5c40ea614d484439ba58"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"
"""

# ╔═╡ Cell order:
# ╠═8bbca1c0-bcae-11ed-3ea1-5fe818f56ccb
# ╠═fd66603b-24d4-493e-a09f-e66666fc3999
# ╠═ae6b7b57-47b6-4712-b13d-4cddb5526139
# ╠═dc64c8f7-51ac-432a-8863-e2dbba57caca
# ╠═d77e0ada-200c-4840-84e4-be9b2dd214f3
# ╠═0195cc47-10c6-460d-9d1f-695d9fcd9593
# ╠═d49a926f-f82d-4794-9104-b1c1a0a37b13
# ╠═5d64595d-8ac8-4809-8a92-7eae41e1be27
# ╠═59deb86a-8fb9-4172-b579-c1fbef38e069
# ╠═77e20fc6-bee3-44e7-a70b-5c8dc91b54e2
# ╠═5a6e5037-4752-468c-877d-c785652bae6c
# ╠═da8101fd-31fb-419b-afc5-fec10e570b72
# ╠═0aa78dca-37f1-41fc-b5ca-37af1bc1455e
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
