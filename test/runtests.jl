#!/usr/bin/env julia

using ProgressBar

println("Plain bar:")
print(plain_bar(0))
for i in 1:100
    sleep(0.05)
    print(join([Char(0x8) for _ in 1:80]))
    print(plain_bar(i, percent=true))
end
println()
