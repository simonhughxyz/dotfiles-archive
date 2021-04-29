#!/bin/sh
# 
# VIMWIKI_CONVERT
# 
# AUTHOR: Simon H Moore
# DATE: Thu 29 Apr 2021
# 
# Desc: Convert markdown files from vimwiki

# Input arguments passed from vimwiki (see `:h vimwiki-option-custom_wiki2html`)
force="${1}"
syntax="${2}"
extension="${3}"
output_dir="${4}"
input_file="${5}"
css_file="${6}"
template_path="${7}"
template_default="${8}"
template_ext="${9}"
root_path="${10}"
custom_args="${11}"
