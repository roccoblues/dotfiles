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
    s("errn", fmt("if err != nil {{\n\treturn nil\n}}\n\n", {} )),
    s("errnw", fmt("if err != nil {{\n\treturn fmt.Errorf(\"{}\", err)\n}}\n\n", { i(0, "message %w") } )),
    s("errt", fmt("if err != nil {{\n\tt.Fatal(err)\n}}\n\n", {} )),
    s("fori", fmt("for {} := 0; {} < {}; {}++ {{\n\t{}\n}}", { i(1, "i"), rep(1), i(2, "n"), rep(1), i(0) })),
    s("forr", fmt("for {}, {} := range {} {{\n\t{}\n}}", { i(2, "k"), i(3, "v"), i(1), i(0) })),
    s("func", fmt("func {}({}) {} {{\n\t{}\n}}", { i(1, "name"), i(2, "params"), i(3), i(0) })),
    s("qq", fmt("q.Q({})", { i(0) }))
}
