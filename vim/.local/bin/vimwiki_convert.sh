#!/bin/sh
# 
# VIMWIKI_CONVERT
# 
# AUTHOR: Simon H Moore
# DATE: Thu 29 Apr 2021
# 
# Desc: Convert markdown files from vimwiki

_dependency(){ command -v "$1" > /dev/null || { echo "error: "$1" not found"; exit 1; }; }
_dependency "pandoc"

# Input arguments passed from vimwiki (see `:h vimwiki-option-custom_wiki2html`)
force="${1}"            # [0/1] overwrite an existing file
syntax="${2}"           # the syntax chosen for this wiki
extension="${3}"        # the file extension for this wiki
output_dir="${4}"       # the full path of the output directory
input_file="${5}"       # the full path of the wiki page
css_file="${6}"         # the full path of the css file for this wiki
template_path="${7}"    # the full path to the wiki's templates
template_default="${8}" # the default template name
template_ext="${9}"     # the extension of template files
root_path="${10}"       # a count of ../ for pages buried in subdirs
custom_args="${11}"     # custom arguments that will be passed to the conversion

input_file_name="${input_file##*/}"
output_file="${output_dir}/${input_file_name%.${extension}}.html"

# title is first level 1 heading of markdown
title="$( grep -m 1 "^#[[:space:]][[:space:]]*.*$" "$input_file" )"

template="${template_path}/${template_default}.${template_ext}"

pandoc --section-divs -s --highlight-style=pygments --metadata pagetitle="$title" -f markdown -t html -o "$output_file" "$input_file"
