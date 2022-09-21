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

function day_ordinal(dayn)
    last_digit = dayn % 10
    if last_digit == 1 and dayn ~= 11
        then return 'st'
    elseif last_digit == 2 and dayn ~= 12
        then return 'nd'
    elseif last_digit == 3 and dayn ~= 13
        then return 'rd'
    else 
        return 'th'
    end
end

function datef(datestr,date)
    date = date or os.date("*t", os.time())
    datestr = string.gsub(datestr,"%%o",day_ordinal(date.day))
    return os.date(datestr,os.time(date))
end 

local now = function() 
    return {datef('%a %d%o %b %Y')} 
end

local filename = function()
    return vim.fn.expand('%')
end

ls.add_snippets(nil, {
    sh = {
        s({
            trig = "shebang",
            namr = "Shebang",
            dscr = "#!/bin/sh",
        }, {
            c(1, {
            t("#!/bin/sh"),
            t("#!/bin/bash"),
            t("#!/bin/zsh"),
            t("#!/bin/dash"),
            }),
        }),
        s({
            trig = "header",
            namr = "Header",
            dscr = "Header for shell script",
        }, {
            c(1, {
            t("#!/bin/sh"),
            t("#!/bin/bash"),
            t("#!/bin/zsh"),
            t("#!/bin/dash"),
            }),
            t({"",
            "#",
            "# NAME: "}), f(filename),
            t({"","# AUTH: Simon H Moore <simon@simonhugh.xyz>"}),
            t({"","# DATE: "}), f(now),
            t({"","# DESC: "}), i(2),
            t({"","",""}), i(0),
        }),
    },
})
