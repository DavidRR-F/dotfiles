
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("sh", {
    -- Bash shebang
    s("shebang", {
        t("#!/bin/bash -eu"),
    }),

    -- Function definition
    s("func", {
        t("function "),
        i(1, "my_function"),
        t(" {"),
        t({"", "  "}),
        i(2, "-- body"),
        t({"", "}"}),
    }),
    -- If statement
    s("if", {
        t("if [ "),
        i(1, "$condition"),
        t(" ]; then"),
        t({"", "  "}),
        i(2, "# code to execute"),
        t({"", "fi"}),
    }),

    -- For loop
    s("for", {
        t("for "),
        i(1, "i"),
        t(" in "),
        i(2, "1 2 3 4 5"),
        t({"", "do"}),
        t({"", "  "}),
        i(3, "# loop body"),
        t({"", "done"}),
    }),

    -- While loop
    s("while", {
        t("while [ "),
        i(1, "$condition"),
        t(" ]; do"),
        t({"", "  "}),
        i(2, "# loop body"),
        t({"", "done"}),
    }),

    -- Command substitution
    s("cmdsub", {
        t("$( "),
        i(1, "command"),
        t(" )"),
    }),

    -- Variable assignment
    s("var", {
        t("local var="),
        i(1, "value"),
    }),

    -- Find files
    s("find", {
        t("find "),
        i(1, "/path/to/directory"),
        t(" -name '"),
        i(2, "*.txt"),
        t("'"),
    }),
})
