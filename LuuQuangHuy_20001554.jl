### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 33e91070-c7ba-11ed-21a0-6f9efc6aadf1
using DelimitedFiles

# ╔═╡ 3baa3aa4-e1d1-4656-b1ee-03056b8a4b97
path1 = "/Users/luuqu/OneDrive/Desktop/ML/winequality-white.csv"

# ╔═╡ ade49fb7-abc0-4b6b-8a90-70f9ffadbe4d
path2 = "/Users/luuqu/OneDrive/Desktop/ML/winequality-red.csv"

# ╔═╡ 4982a828-7f7a-4604-a1b7-2e177adcdb77
A1 = readdlm(path1, ';')

# ╔═╡ 21e5c344-4b5a-44c5-bf8c-1fac6c5afa21
A2 = readdlm(path2, ';')

# ╔═╡ 9de9bfa7-5cbc-44f2-8ca8-a60c59aaa793
y1 = float.(A1[2:end, end])

# ╔═╡ ec0c8cdd-cc12-49ed-a901-67867734e9d2
N1 = length(y1)

# ╔═╡ 7d4f34d4-7214-4943-8bae-e94d881f5570
y2 = float.(A2[2:end, end])

# ╔═╡ 1d412505-204e-427a-b036-0b3af6d7400f
N2 = length(y2)

# ╔═╡ 6d622e2c-57e1-4416-b327-a0cca1e9e20a
X1 = [ones(length(y1)) float.(A1[2:end, 1:end-1])]

# ╔═╡ 9f230ff6-f271-4853-850d-a100e45e1ff4
X2 = [ones(length(y2)) float.(A2[2:end, 1:end-1])]

# ╔═╡ 724d87c4-8110-4a42-9272-e9fb229c794c
train(X,y) = inv(X'*X)*X'*y

# ╔═╡ 7ccab16c-5e9e-4f16-b568-03249b59c90e
θ_1 = train(X1,y1)

# ╔═╡ e10a1ab0-687b-458e-aadf-9b4fa0464e69
θ_2 = train(X2,y2)

# ╔═╡ 776bd7d0-d1de-44c4-aaf5-74d2b5f62ec8
predict(θ, xNew) = xNew*θ

# ╔═╡ 9cd73f54-d552-47f6-840f-ab12bbbb7661
ŷ1 = predict(θ_1, X2)

# ╔═╡ 24ae8a59-521e-470b-84da-b7800bb28f9a
ϵ = 0.5

# ╔═╡ d85dcf14-1c97-4537-a61d-0f1ae89364b3
# ╠═╡ disabled = true
#=╠═╡
accuracy1 = sum(abs.(y1 - ŷ1) .<= ϵ) / N1
  ╠═╡ =#

# ╔═╡ 9ec3daa1-7fc7-41f4-afd2-fb0d6ed80569
ŷ2 = predict(θ_2, X1)

# ╔═╡ bbd33a42-f1e3-499d-89fa-f77c69a16ee8
# ╠═╡ disabled = true
#=╠═╡
accuracy2 = sum(abs.(y2 - ŷ2) .<= ϵ) / N2
  ╠═╡ =#

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
# ╠═33e91070-c7ba-11ed-21a0-6f9efc6aadf1
# ╠═3baa3aa4-e1d1-4656-b1ee-03056b8a4b97
# ╠═ade49fb7-abc0-4b6b-8a90-70f9ffadbe4d
# ╠═4982a828-7f7a-4604-a1b7-2e177adcdb77
# ╠═21e5c344-4b5a-44c5-bf8c-1fac6c5afa21
# ╠═9de9bfa7-5cbc-44f2-8ca8-a60c59aaa793
# ╠═ec0c8cdd-cc12-49ed-a901-67867734e9d2
# ╠═7d4f34d4-7214-4943-8bae-e94d881f5570
# ╠═1d412505-204e-427a-b036-0b3af6d7400f
# ╠═6d622e2c-57e1-4416-b327-a0cca1e9e20a
# ╠═9f230ff6-f271-4853-850d-a100e45e1ff4
# ╠═724d87c4-8110-4a42-9272-e9fb229c794c
# ╠═7ccab16c-5e9e-4f16-b568-03249b59c90e
# ╠═e10a1ab0-687b-458e-aadf-9b4fa0464e69
# ╠═776bd7d0-d1de-44c4-aaf5-74d2b5f62ec8
# ╠═9cd73f54-d552-47f6-840f-ab12bbbb7661
# ╠═24ae8a59-521e-470b-84da-b7800bb28f9a
# ╠═d85dcf14-1c97-4537-a61d-0f1ae89364b3
# ╠═9ec3daa1-7fc7-41f4-afd2-fb0d6ed80569
# ╠═bbd33a42-f1e3-499d-89fa-f77c69a16ee8
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
