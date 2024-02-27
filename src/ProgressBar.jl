module ProgressBar
export simple_bar

# One way to make a unicode character: Char(0x2501)
# Another way: "\u2501"

function simple_bar(completion::Real; percent::Bool=false)
    percent_completion::Int = 0
    pereighty_completion::Int = 0
    if percent
        percent_completion = round(min(completion, 100))
        pereighty_completion = round(min(completion * 80 / 100, 80))
    else
        percent_completion = round(min(100 * completion, 100))
        pereighty_completion = round(min(80 * completion, 80))
    end

    left_pad = 41 - ndigits(percent_completion)
    right_pad = 38

    left_filled = min(pereighty_completion, left_pad)
    right_filled = min(max(pereighty_completion - 42, 0), right_pad)

    return join(vcat(
        [Char(0x2501) for _ in 1:left_filled],
        [" " for _ in (left_filled + 1):left_pad],
        string(percent_completion) * "%",
        [Char(0x2501) for _ in 1:right_filled],
        [" " for _ in (right_filled + 1):right_pad]
    ))
end

end
