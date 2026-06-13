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
  printf("Hello, world!\n");
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
typedef struct {} {{
  {}
}} {};

]], { i(1, "name"), i(0), i(1) })),

  s("printf", fmt([[
printf("{}"{});
]], { i(1), f(function(_, snip) return snip.env and ", " .. snip.env.TM_SELECTED_TEXT or "" end) })),

  s("enum", fmt([[
typedef enum {{
  {}
}} {};
]], { i(0), i(1, "name") })),

  s("ifdef", fmt([[
#ifdef {}
{}
#endif
]], { i(1), i(0) })),
}
