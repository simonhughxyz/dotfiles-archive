-- all.lua

local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local file_name = function() return vim.fn.expand('%') end
local file_extension = function() return vim.fn.expand('%:e') end
local file_no_extension = function() return vim.fn.expand('%:r') end

local full_path_name = function() return vim.fn.expand('%:p') end
local path = function() return vim.fn.expand('%:p:h') end

ls.add_snippets(nil, {
    all = {
        s({
            trig = "signature",
            namr = "Signature",
            dscr = "Print personal signature",
        }, {
            c(1, {
                t({"Simon H Moore","simon@simonhugh.xyz"}),
                t("Simon H Moore"),
            })
        }),
        s({
            trig = "email",
            namr = "Email",
            dscr = "My email address",
        }, {
            c(1, {
                t("simon@simonhugh.xyz"),
                {i(1), t("@simonhugh.xyz")},
            })
        }),
        s({
            trig = "domain",
            namr = "Domain",
            dscr = "Print personal domain",
        }, {
            c(1, {
                t("simonhugh.xyz"),
                t("www.simonhugh.xyz"),
                t("https://simonhugh.xyz/"),
                t("https://www.simonhugh.xyz/"),
            })
        }),
        s({
            trig = "name",
            namr = "Name",
            dscr = "My Name Simon H Moore",
        }, {
            c(1, {
                t("Simon H Moore"),
                t("Simon Hugh Moore"),
                t("Simon Moore"),
                t("Simon"),
                t("Moore"),
                t("Hugh"),
            })
        }),
        s({
            trig = "initials",
            namr = "Initials",
            dscr = "Print my initials",
        }, {
            c(1, {
                t("SHM"),
                t("S.H.M"),
            })
        }),
        s({
            trig = "filename",
            namr = "File Name",
            dscr = "Print file name",
        }, {
            c(1, {
                f(file_name),
                f(file_no_extension),
                f(file_extension),
            })
        }),
        s({
            trig = "basename",
            namr = "Basename",
            dscr = "Print file name without path or suffix",
        }, {
            c(1, {
                f(file_no_extension),
                f(file_name),
                f(file_extension),
            })
        }),
        s({
            trig = "pathname",
            namr = "Path Name",
            dscr = "Print full path name of file",
        }, {
            c(1, {
                f(full_path_name),
                f(path),
            })
        }),
        s({
            trig = "path",
            namr = "Path",
            dscr = "Print full path of file without file name",
        }, {
            c(1, {
                f(full_path_name),
                f(path),
            })
        }),
        s({
            trig = "extension",
            namr = "Extension",
            dscr = "Print the file extension",
        }, {
            f(file_extension)
        }),
    },
})
