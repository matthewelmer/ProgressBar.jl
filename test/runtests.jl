#!/usr/bin/env julia

using ProgressBar

# Progress bar
println(join([Char(0x2501) for _ in 1:80]))

# Progress bar with single-digit percentage
println(join(vcat([Char(0x2501) for _ in 1:40], "9%", [Char(0x2501) for _ in 43:80])))

# Progress bar with double-digit percentage
println(join(vcat([Char(0x2501) for _ in 1:39], "69%", [Char(0x2501) for _ in 43:80])))

# Progress bar with triple-digit (100%, done) percentage
println(join(vcat([Char(0x2501) for _ in 1:38], "100%", [Char(0x2501) for _ in 43:80])))
