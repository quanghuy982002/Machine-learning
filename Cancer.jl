### A Pluto.jl notebook ###
# v0.19.22

using Markdown
using InteractiveUtils

# ╔═╡ 435d1280-bcbc-11ed-0934-fb14bf503317
using DelimitedFiles

# ╔═╡ fba00486-61d5-43dd-8f25-6db1c1be9d67
cancerPath = "/Users/luuqu/OneDrive/Desktop/ML/wdbc.txt"

# ╔═╡ a8f415e0-b9bd-49d0-882a-f5954c17a3a9
A = readdlm(cancerPath)

# ╔═╡ 828754f0-e1e0-40cb-ab16-0a6a0be3174f
function readData(path)
	A = readdlm(path)
	y = Int.(A[:,1])
	X = A[:,2:end]
	(X,y)	
end

# ╔═╡ 3200424e-6975-4ea1-b362-2af4870375f1
X,y = readData(cancerPath)

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
# ╠═435d1280-bcbc-11ed-0934-fb14bf503317
# ╠═fba00486-61d5-43dd-8f25-6db1c1be9d67
# ╠═a8f415e0-b9bd-49d0-882a-f5954c17a3a9
# ╠═828754f0-e1e0-40cb-ab16-0a6a0be3174f
# ╠═3200424e-6975-4ea1-b362-2af4870375f1
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
