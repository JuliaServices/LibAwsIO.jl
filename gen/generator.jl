using Clang.Generators
using Clang.JLLEnvs
using JLLPrefixes
import aws_c_common_jll, aws_c_io_jll

cd(@__DIR__)

function remove_itt_symbols!(dag::ExprDAG)
    for i in eachindex(dag.nodes)
        node = dag.nodes[i]
        for expr in get_exprs(node)
            node_name = if expr.head == :function
                if expr.args[1].args[1] isa Expr # function is Module.name instead of just name
                    expr.args[1].args[1].args[2]
                else
                    expr.args[1].args[1]
                end
            elseif expr.head == :struct
                if expr.args[2] isa Expr # struct has type parameter
                    expr.args[2].args[1]
                else
                    expr.args[2]
                end
            elseif expr.head == :const
                expr.args[1].args[1]
            end
            # remove the node by renaming it to IGNORED, which we include in the generator's ignorelist
            if contains(lowercase(string(node_name)), "itt")
                dag.nodes[i] = ExprNode(:IGNORED, node.type, node.cursor, node.exprs, node.premature_exprs, node.adj)
            end
        end
    end
    return nothing
end

for target in JLLEnvs.JLL_ENV_TRIPLES
    if target == "i686-w64-mingw32"
        # aws_c_io_jll does not support i686 windows https://github.com/JuliaPackaging/Yggdrasil/blob/bbab3a916ae5543902b025a4a873cf9ee4a7de68/A/aws_c_common/build_tarballs.jl#L48-L49
        continue
    end
    options = load_options(joinpath(@__DIR__, "generator.toml"))
    options["general"]["output_file_path"] = joinpath(@__DIR__, "..", "lib", "$target.jl")

    header_dirs = []
    args = get_default_args(target)
    inc = JLLEnvs.get_pkg_include_dir(aws_c_common_jll, target)
    push!(args, "-I$inc")
    # push!(header_dirs, inc)
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

    # build without printing so we can do custom rewriting
    build!(ctx, BUILDSTAGE_NO_PRINTING)

    # the ITT symbols are just for aws-c-common's profiling stuff, we don't need to generate them and they cause
    # problems with the generated code
    # remove_itt_symbols!(ctx.dag)

    # print
    build!(ctx, BUILDSTAGE_PRINTING_ONLY)
end
