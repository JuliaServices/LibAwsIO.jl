using Clang.Generators
using Clang.JLLEnvs
using JLLPrefixes
import aws_c_common_jll, aws_c_io_jll

cd(@__DIR__)

const unsupported_targets = ("i686-w64-mingw32", "armv7l-linux-gnueabihf", "armv7l-linux-musleabihf", "x86_64-unknown-freebsd")

for target in JLLEnvs.JLL_ENV_TRIPLES
    if target ∈ unsupported_targets
        continue
    end
    options = load_options(joinpath(@__DIR__, "generator.toml"))
    options["general"]["output_file_path"] = joinpath(@__DIR__, "..", "lib", "$target.jl")

    args = get_default_args(target)
    inc = JLLEnvs.get_pkg_include_dir(aws_c_common_jll, target)
    push!(args, "-isystem$inc")

    header_dirs = []
    inc = JLLEnvs.get_pkg_include_dir(aws_c_io_jll, target)
    push!(args, "-I$inc")
    push!(header_dirs, inc)

    headers = String[]
    for header_dir in header_dirs
        for (root, dirs, files) in walkdir(header_dir)
            for file in files
                if endswith(file, ".h")
                    push!(headers, joinpath(root, file))
                end
            end
        end
    end
    unique!(headers)

    ctx = create_context(headers, args, options)
    build!(ctx)
end
