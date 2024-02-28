#!/usr/bin/env julia

using ProgressBar

println("Plain bar:")
print("\e[?25l")
print(plain_bar(0))
for i in 1:100
    sleep(0.025)
    print(join(repeat(Char(0x8), 80)))
    print(plain_bar(i, percent=true))
end
println()
print("\e[?25h")

println("Inferno bar:")
print("\e[?25l")
print(colorful_bar(0, rangescale=(-0.4, 1.0)))
for i in 1:100
    sleep(0.025)
    print(join(repeat(Char(0x8), 80)))
    print(colorful_bar(i, percent=true, rangescale=(-0.4, 1.0)))
end
println()
print("\e[?25h")

println("Inferno bar (changes to green when done):")
print("\e[?25l")
print(colorful_bar(0, rangescale=(-0.4, 1.0)))
for i in 1:100
    sleep(0.025)
    print(join(repeat(Char(0x8), 80)))
    print(colorful_bar(i, percent=true, rangescale=(-0.4, 1.0)))
end
print(join(repeat(Char(0x8), 80)))
println(GREEN_COMPLETED_BAR)
print("\e[?25h")

println("Pink bar:")
print("\e[?25l")
print(colorful_bar(0, cscheme=colorschemes[:pink]))
for i in 1:100
    sleep(0.025)
    print(join(repeat(Char(0x8), 80)))
    print(colorful_bar(i, percent=true, cscheme=colorschemes[:pink]))
end
println()
print("\e[?25h")
