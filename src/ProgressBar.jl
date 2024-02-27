module ProgressBar
export plain_bar, colorful_bar, colorschemes

using ColorSchemes: RGB, colorschemes, ColorScheme, get

function plain_bar(completion::Real; percent::Bool=false)
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
        repeat(Char(0x2501), left_filled),
        repeat(" ", left_pad - left_filled),
        string(percent_completion) * "%",
        repeat(Char(0x2501), right_filled),
        repeat(" ", right_pad - right_filled)
    ))
end

function colorful_bar(completion::Real; percent::Bool=false, cscheme::ColorScheme=colorschemes[:inferno], rangescale=(0.0, 1.0))
    percent_completion::Int = 0
    pereighty_completion::Int = 0
    bar_color::RGB = RGB(0.0, 0.0, 0.0)
    if percent
        percent_completion = round(min(completion, 100))
        pereighty_completion = round(min(completion * 80 / 100, 80))
        bar_color = get(cscheme, completion / 100, rangescale)
    else
        percent_completion = round(min(100 * completion, 100))
        pereighty_completion = round(min(80 * completion, 80))
        bar_color = get(cscheme, completion, rangescale)
    end

    left_pad = 41 - ndigits(percent_completion)
    right_pad = 38

    left_filled = min(pereighty_completion, left_pad)
    right_filled = min(max(pereighty_completion - 42, 0), right_pad)

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

end
