using LibAwsIO
using Documenter

DocMeta.setdocmeta!(LibAwsIO, :DocTestSetup, :(using LibAwsIO); recursive=true)

makedocs(;
    modules=[LibAwsIO],
    repo="https://github.com/JuliaServices/LibAwsIO.jl/blob/{commit}{path}#{line}",
    sitename="LibAwsIO.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://github.com/JuliaServices/LibAwsIO.jl",
        assets=String[],
        size_threshold=2_000_000, # 2 MB, we generate about 1 MB page
        size_threshold_warn=2_000_000,
    ),
    pages=["Home" => "index.md"],
)

deploydocs(; repo="github.com/JuliaServices/LibAwsIO.jl", devbranch="main")
