local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("cout", fmt([[
std::cout << {} << std::endl;
]], { i(1) })),

  s("class", fmt([[
class {} {{
public:
  {}({}) {}
  ~{}() = default;

private:
  {}
}};
]], {
    i(1, "Name"),
    i(1),
    i(2),
    i(0),
    i(1),
    i(3),
  })),

  s("vector", fmt([[
std::vector<{}> {};
]], { i(1, "int"), i(2, "v") })),

  s("auto", fmt([[
auto {} = {};
]], { i(1, "name"), i(2, "expr") })),

  s("struct", fmt([[
struct {} {{
  {}
}};
]], { i(1, "Name"), i(0) })),

  s("enum", fmt([[
enum class {} {{
  {}
}};
]], { i(1, "Name"), i(0) })),

  s("range-for", fmt([[
for (const auto& {} : {}) {{
  {}
}}
]], { i(1, "elem"), i(2, "container"), i(0) })),
}
