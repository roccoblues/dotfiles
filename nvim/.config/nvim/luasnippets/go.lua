local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
	s(":", fmt("{} := {}", { i(1, "v"), i(0, "value") })),
    s("ap", fmt("append({}, {})", { i(1, "slice"), i(0, "value") })),
    s("ap=", fmt("{} = append({}, {})", { i(1, "slice"), rep(1), i(0, "value") })),
	s("ife", fmt("if err := {}; err != nil {{\n\t{}\n}}", { i(1, "condition"), i(0) })),
    s("iota", fmt("const (\n\t{} = iota\n\t{}\n)", { i(1, "name"), i(0) })),
    s("ew", fmt("errors.Wrap({}, \"{}\")", { i(1, "err"), i(0, "message") })),
}
