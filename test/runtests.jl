#!/usr/bin/env julia

using ProgressBar
using Test

@testset "basic bar" begin
    a = 69
    @test a == 69
end
