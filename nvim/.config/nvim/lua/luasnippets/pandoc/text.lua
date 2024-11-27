local get_visual = function(args, parent)
    if #parent.snippet.env.LS_SELECT_RAW > 0 then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else -- If LS_SELECT_RAW is empty, return a blank insert node
        return sn(nil, i(1))
    end
end

return {
    s(
        { trig = "tit", dscr = "Expands 'tii' into LaTeX's textit{} command." },
        fmta("\\textit{<>}", {
            d(1, get_visual),
        })
    ),
    s(
        { trig = "tt", dscr = "Expands 'tt' into LaTeX's text{} command." },
        fmta("\\text{<>}", {
            d(1, get_visual),
        })
    ),
    s(
        { trig = "ttt", dscr = "Expands 'ttt' into LaTeX's texttt{} command." },
        fmta("\\texttt{<>}", {
            d(1, get_visual),
        })
    ),
}
