#!/usr/bin/env julia

using ProgressBar

print(simple_bar(0))
sleep(1)

for i in 1:100
    sleep(0.05)
    print(join([Char(0x8) for _ in 1:80]))
    print(simple_bar(i, percent=true))
end
println()
