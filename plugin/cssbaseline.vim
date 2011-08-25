" ============================================================
" File:          cssbaseline.vim
" Description:   Build empty CSS blocks from HTML
" Author:        Kien Nguyen <info@designtomarkup.com>
" License:       MIT
" Repository:    https://github.com/kien/cssbaseline.vim
" ============================================================

if exists('g:loaded_cssbaseline') && g:loaded_cssbaseline
  finish
endif
let g:loaded_cssbaseline = 1

com! -nargs=* -range Baseline cal cssbaseline#init(<line1>,<line2>,<f-args>)
