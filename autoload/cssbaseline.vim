" ============================================================
" File:          cssbaseline.vim
" Description:   Interfacing with css-generator and primercss
"                to create a CSS baseline
" Author:        Kien Nguyen <info@designtomarkup.com>
" License:       MIT
" Repository:    https://github.com/kien/cssbaseline.vim
" ============================================================

let s:save_cpo = &cpo
set cpo&vim

" .vimrc option
if !exists('g:cssbaseline_curl')
	let g:cssbaseline_curl = ''
endif

func! cssbaseline#init(l1,l2,...)
	if !executable('curl')
		echohl Error
		echo 'This plugin requires cURL.'
		echohl None
		retu
	endif
	let sites = [
				\ 'http://lab.xms.pl/css-generator/',
				\ 'http://primercss.com/index.php',
				\ ]
	let line1 = a:l1
	let line2 = a:l2
	if !exists('a:1')
		let a1 = 0
	elseif exists('a:1')
		let a1 = a:1[0]
	endif
	let enc = ' --data-urlencode'
	if a1 == 0
		let va = 'xhtml'
	elseif a1 == 1
		let va = 'htmlsrc'
	endif
	exe line1
	norm! v
	exe line2
	norm! "*y
	try
		let html = substitute(@*, '\n', '', 'g')
		let html = substitute(html, '\s\+', ' ', 'g')
		let html = substitute(html, '<!--[^>]\+-->', '', 'g')
		let html = substitute(html, '>[^<]\+<', '><', 'g')
		let html = substitute(html, '&', '', 'g')
		let html = escape(html, '"')
		let page = system('curl '.g:cssbaseline_curl.' -sS'.enc.' "'.va.'='.html.'" '.sites[a1])
		let page = substitute(page, '\n', '', 'g')
		let css = matchstr(page, '<textarea[^>]\+>\zs[^<]\+\ze</textarea>')
		let css = substitute(css, '/\*[^*/]\+\*/', '', 'g')
		let css = substitute(css, '}', '}\n', 'g')
		let css = substitute(css, '\n\s\+', '\n', 'g')
		let css = substitute(css, '\(^\|\n\| \)\w\+\(\.\|#\)', '\1\2', 'g')
		let @* = substitute(css, '{\s*', '{', 'g')
	catch
		echohl Error
		echo 'An error occurred, probably E484. Try selecting less HTML.'
		echohl None
	endtry
endfunc

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:nofen:noet:ts=2:sw=2:sts=2
