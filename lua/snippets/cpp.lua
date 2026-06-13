local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function guard_name()
  local name = vim.fn.expand("%:t:r")
  return name:upper():gsub("[^%w]", "_") .. "_H"
end

return {
  s("hdg", fmt([[
#ifndef {}
#define {}

{}

#endif /* {} */
]], {
    f(guard_name),
    f(guard_name),
    i(0),
    f(guard_name),
  })),

  s("inc", fmt([[
#include <{}>
]], { i(1) })),

  s("incq", fmt([[
#include "{}"
]], { i(1) })),

  s("main", fmt([[
int main(int argc, char *argv[])
{{
  {}

  return 0;
}}
]], { i(0) })),

  s("for", fmt([[
for (int {} = {}; {} < {}; {}++) {{
  {}
}}
]], {
    i(1, "i"), i(2, "0"), i(1), i(3, "n"), i(1), i(0),
  })),

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

  s("ifdef", fmt([[
#ifdef {}
{}
#endif
]], { i(1), i(0) })),

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

  s("range-for", fmt([[
for (const auto& {} : {}) {{
  {}
}}
]], { i(1, "elem"), i(2, "container"), i(0) })),
}
