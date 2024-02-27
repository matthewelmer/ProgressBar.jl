#!/usr/bin/env julia

using ProgressBar

println("Plain bar:")
print(plain_bar(0))
for i in 1:100
    sleep(0.025)
    print(join([Char(0x8) for _ in 1:80]))
    print(plain_bar(i, percent=true))
end
println()

println("Inferno bar:")
print(colorful_bar(0, rangescale=(-0.4, 1.0)))
for i in 1:100
    sleep(0.025)
    print(join([Char(0x8) for _ in 1:80]))
    print(colorful_bar(i, percent=true, rangescale=(-0.4, 1.0)))
end
println()

println("Inferno bar (changes to green when done):")
print(colorful_bar(0, rangescale=(-0.4, 1.0)))
for i in 1:100
    sleep(0.025)
    print(join([Char(0x8) for _ in 1:80]))
    print(colorful_bar(i, percent=true, rangescale=(-0.4, 1.0)))
end
print(join([Char(0x8) for _ in 1:80]))
println(GREEN_COMPLETED_BAR)

println("Winter bar:")
print(colorful_bar(0, cscheme=colorschemes[:winter]))
for i in 1:100
    sleep(0.025)
    print(join([Char(0x8) for _ in 1:80]))
    print(colorful_bar(i, percent=true, cscheme=colorschemes[:winter]))
end
println()
