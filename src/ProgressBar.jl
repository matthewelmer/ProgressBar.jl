module ProgressBar
export simple_bar

# One way to make a unicode character: Char(0x2501)
# Another way: "\u2501"

function simple_bar(completion::Real; percent::Bool=false)
    percent_completion::Int = 0
    if percent
        percent_completion = round(min(completion, 100))
    else
        percent_completion = round(min(100 * completion, 100))
    end

    num_leading_characters = 41 - ndigits(percent_completion)
    num_trailing_characters = 38

    return join(vcat(
        [Char(0x2501) for _ in 1:num_leading_characters],
        string(percent_completion) * "%",
        [Char(0x2501) for _ in 1:num_trailing_characters]
    ))
end

end
