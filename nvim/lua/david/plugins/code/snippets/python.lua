local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("python", {
    -- Python shebang
    s("shebang", {
        t("#!/usr/bin/env python3"),
    }),

    -- Function definition
    s("def", {
        t("def "),
        i(1, "function_name"),
        t("("),
        i(2, "value: str"),
        t(") -> "),
        i(3, "None"),
        t({":", "    "}),
        i(4, "# function body"),
    }),

    -- Class definition
    s("class", {
        t("class "),
        i(1, "ClassName"),
        t(":"),
        t({"", "  "}),
        t("def __init__(self, "),
        i(2, "value: str"),
        t(") -> None:"),
        t({"", "    "}),
        i(3, "# class body"),
    }),

    -- If statement
    s("if", {
        t("if "),
        i(1, "condition"),
        t(":"),
        t({"", "    "}),
        i(2, "# code to execute"),
    }),

    -- else if statement
    s("elif", {
        t("elif "),
        i(1, "condition"),
        t(":"),
        t({"", "    "}),
        i(2, "# code to execute"),
    }),

    -- Try/Except block
    s("try", {
        t("try:"),
        t({"", "    "}),
        i(1, "# try block"),
        t({"", "except Exception as e:", "", "    "}),
        i(2, "print(e)"),
    }),

    -- For loop
    s("for", {
        t("for "),
        i(1, "i"),
        t(" in "),
        i(2, "range(10):"),
        t({"", "    "}),
        i(3, "# loop body"),
    }),

    -- While loop
    s("while", {
        t("while "),
        i(1, "condition"),
        t(":"),
        t({"", "    "}),
        i(2, "# loop body"),
    }),

    -- List comprehension
    s("listcomp", {
        t("["),
        i(1, "x"),
        t(" for "),
        i(2 ,"x"),
        t(" in "),
        i(3, "iterable"),
        t(" if "),
        i(4, "condition"),
        t("]"),
    }),

    -- Dictionary comprehension
    s("dictcomp", {
        t("{"),
        i(1, "key"),
        t(": "),
        i(2, "value"),
        t(", "),
        i(3, "value"),
        t(" in "),
        i(4, "iterable.items()"),
        t("}"),
    }),

    -- Lambda function
    s("lambda", {
        t("lambda "),
        i(1, "args"),
        t(": "),
        i(2, "expression"),
    }),

    -- File opening with context manager
    s("withopen", {
        t("with open('"),
        i(1, "file.txt"),
        t("', 'r') as f:"),
        t({"", "    "}),
        i(2, "# process file"),
    }),

    -- Function call
    s("call", {
        i(1, "function_name"),
        t("("),
        i(2, "args"),
        t(")"),
    }),
})
