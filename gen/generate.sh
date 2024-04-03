#!/bin/bash
dir=$(dirname "$0")
julia +1.10 --project="$dir" -e 'using Pkg; Pkg.instantiate()'
julia +1.10 --project="$dir" "$dir/generator.jl"
