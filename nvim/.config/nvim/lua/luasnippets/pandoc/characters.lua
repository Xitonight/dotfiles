local in_mathzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	s(
		{ trig = ";in", snippetType = "autosnippet" },
		{ t("\\in") },
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";a", snippetType = "autosnippet" },
		{ t("\\alpha") },
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";b", snippetType = "autosnippet" },
		{ t("\\beta") },
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";g", snippetType = "autosnippet" },
		{ t("\\gamma") },
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";phi", snippetType = "autosnippet" },
		{ t("\\phi") },
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";pi", snippetType = "autosnippet" },
		{ t("\\pi") },
		{ condition = in_mathzone }
	),
}
