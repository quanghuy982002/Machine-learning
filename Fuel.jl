### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 51e01dc0-c239-11ed-2c00-357ac176c07b
using DelimitedFiles

# ╔═╡ 736fcbcc-d07e-4ec5-942c-54b723cd5b5d
A = readdlm("/Users/luuqu/OneDrive/Desktop/ML/fuel.txt", ',')

# ╔═╡ 5786db73-66e6-40b8-a012-936f8f8054b7
fuelC = A[2:end, 3]

# ╔═╡ 98604cf9-6024-4f65-bced-2d5e884a4be7
tax = float.(A[2:end, end])

# ╔═╡ 77bbb153-1338-4ffc-a0f6-7052230e51d3
drivers = A[2:end, 2]

# ╔═╡ f604ca4d-1717-48c6-9f0b-22678538495d
pop = A[2:end, end - 1]

# ╔═╡ ee12579f-2bf1-40d9-ab54-27d1bc521d06
y = 1000 .* fuelC ./ pop

# ╔═╡ b15503b9-5605-42c1-83ea-c5a7d6b0cdbd
N = length(y)

# ╔═╡ c67e2545-8cdf-4dc1-b70c-beca9a9c8d7f
Dlic = 1000 .* drivers ./ pop

# ╔═╡ 13c2bc9b-9e33-4972-be96-0afddf9cee0e
income = float.(A[2:end, 4])

# ╔═╡ 4aad00a2-1eae-4ff8-8eb5-27c84eeac597
miles = A[2:end, 5]

# ╔═╡ 2cca2fc8-0845-456e-bd52-e74264947585
logMiles = float.(log2.(miles))


# ╔═╡ c35400c6-263a-4593-8c2b-f6bbf6d739b6
X = [ones(N) tax Dlic income logMiles]

# ╔═╡ 1e34bde2-cd0e-4a77-8c09-c6654edf9a0a
train(X,y) = inv(X'*X)*X'*y

# ╔═╡ 13d0604e-3d3f-4162-8d05-ec50c76612b8
θ = train(X, y)

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DelimitedFiles = "8bb1440f-4735-579b-a4ab-409b98df4dab"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.5"
manifest_format = "2.0"
project_hash = "739f2f3af706c750957bd6ec39e0874ba8eb265d"

[[deps.DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"
"""

# ╔═╡ Cell order:
# ╠═51e01dc0-c239-11ed-2c00-357ac176c07b
# ╠═736fcbcc-d07e-4ec5-942c-54b723cd5b5d
# ╠═5786db73-66e6-40b8-a012-936f8f8054b7
# ╠═ee12579f-2bf1-40d9-ab54-27d1bc521d06
# ╠═b15503b9-5605-42c1-83ea-c5a7d6b0cdbd
# ╠═98604cf9-6024-4f65-bced-2d5e884a4be7
# ╠═77bbb153-1338-4ffc-a0f6-7052230e51d3
# ╠═f604ca4d-1717-48c6-9f0b-22678538495d
# ╠═c67e2545-8cdf-4dc1-b70c-beca9a9c8d7f
# ╠═13c2bc9b-9e33-4972-be96-0afddf9cee0e
# ╠═4aad00a2-1eae-4ff8-8eb5-27c84eeac597
# ╠═2cca2fc8-0845-456e-bd52-e74264947585
# ╠═c35400c6-263a-4593-8c2b-f6bbf6d739b6
# ╠═1e34bde2-cd0e-4a77-8c09-c6654edf9a0a
# ╠═13d0604e-3d3f-4162-8d05-ec50c76612b8
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
