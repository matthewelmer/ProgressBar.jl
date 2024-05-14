module ProgressBar
export plain_bar, colorful_bar, colorschemes, green_completed_bar

using ColorSchemes: RGB, colorschemes, ColorScheme, get

function plain_bar(completion::Real; percent::Bool=false)
    if percent
        completion /= 100
    end

    _, cols = displaysize(stdout)
    half_cols = floor(Int, cols/2)

    percent_completion::Int = round(min(100 * completion, 100))
    left_pad = half_cols + 1 - ndigits(percent_completion)
    right_pad = half_cols - 2

    pereighty_completion::Int = round(min(cols * completion, cols))
    left_filled = min(pereighty_completion, left_pad)
    right_filled = min(max(pereighty_completion - (half_cols + 2), 0), right_pad)

    return join(vcat(
        repeat(Char(0x2501), left_filled),
        repeat(" ", left_pad - left_filled),
        string(percent_completion) * "%",
        repeat(Char(0x2501), right_filled),
        repeat(" ", right_pad - right_filled)
    ))
end

function colorful_bar(completion::Real; percent::Bool=false, cscheme::ColorScheme=colorschemes[:inferno], rangescale=(0.0, 1.0))
    if percent
        completion /= 100
    end

    _, cols = displaysize(stdout)
    half_cols = floor(Int, cols/2)

    percent_completion::Int = round(min(100 * completion, 100))
    left_pad = half_cols + 1 - ndigits(percent_completion)
    right_pad = half_cols - 2

    pereighty_completion::Int = round(min(cols * completion, cols))
    left_filled = min(pereighty_completion, left_pad)
    right_filled = min(max(pereighty_completion - (half_cols + 2), 0), right_pad)

    bar_color = get(cscheme, completion, rangescale)
    R::UInt8 = round(bar_color.r * 255)
    G::UInt8 = round(bar_color.g * 255)
    B::UInt8 = round(bar_color.b * 255)

    return join(vcat(
        "\e[38;2;$(R);$(G);$(B)m",
        repeat(Char(0x2501), left_filled),
        repeat(" ", left_pad - left_filled),
        "\e[0m",
        string(percent_completion) * "%",
        "\e[38;2;$(R);$(G);$(B)m",
        repeat(Char(0x2501), right_filled),
        repeat(" ", right_pad - right_filled),
        "\e[0m"
    ))
end

green_completed_bar() = join(vcat(
    "\e[32m",
    repeat(Char(0x2501), floor(Int, displaysize(stdout)[2] / 2) - 2),
    "\e[0m",
    "100%",
    "\e[32m",
    repeat(Char(0x2501), floor(Int, displaysize(stdout)[2] / 2) - 2),
    "\e[0m"
))

# FUTURE WORK(melmer): progress_bar function that defaults to an inferno bar
# that hides the cursor and turns green at 100% but can be passed optional
# arguments to configure the behavior (make the simple path that most people
# will be happy with a one-liner)

end
