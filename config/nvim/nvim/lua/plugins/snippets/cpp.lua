local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Function to inject today's date dynamically
local function date_today()
  return os.date("%m/%d/%Y")
end

ls.add_snippets("cpp", {
  s("cpptemplate", {
    -- Header block
    t({ "/*", " * AUTHOR: Andres Cardenas", " * ASSIGNMENT TITLE: " }),
    i(1, "filename.cpp"), -- Cursor stops here first [1]
    t({ "", " * ASSIGNMENT DESCRIPTION: " }), i(2, "assignment Description"),
    t({ "", " * DUE DATE: "}), i(3, "enter date"),
    t({ "", " * DATE CREATED: "}),
    f(date_today, {}),                                  -- Injects current date automatically
    t({ "", " * DATE LAST MODIFIED: " }),
    f(date_today, {}),                                  -- Injects current date for now
    t({ "", " */", "", "" }),

    -- Boilerplate C++ code
    t({ "#include <iostream>", "using std::cout;", "", "int main() {", "    ", "    " }),
    i(0, "cout << \"Hello World\\n\";"),                                               -- Final cursor stop [0] (inside main)
    t({ "", "", "    return 0;", "}" }),
  }),
})
