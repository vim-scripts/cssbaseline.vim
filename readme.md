[Homepage][5]

Requires Vim 7.3+ and [cURL][1].

For Windows users without cURL, download the binaries from curl.haxx.se and put it in your system's PATH or in the same directory as gvim.exe.

## Usage

* Select a block of HTML from the opening to the closing tag and type either `:Baseline` or `:Baseline1`.
* The retrieved CSS will be copied to your clipboard (* register), ready to be pasted.

`:Baseline` uses lab.xms.pl/css-generator/  
`:Baseline1` uses primercss.com

## Related plugins:

* __[prefixer.vim][2]__ » Add vendor prefixes to CSS3 properties.
* __[html_emogrifier.vim][3]__ » Convert HTML page with linked CSS to HTML email with inline CSS.
* __cssbaseline.vim__ » Build a CSS baseline (empty CSS blocks) from HTML code.
* __[premailer.vim][4]__ » Vim wrapper for the Ruby script Premailer.

[1]: http://curl.haxx.se/download.html#Win32
[2]: https://github.com/kien/prefixer.vim
[3]: https://github.com/kien/html_emogrifier.vim
[4]: https://github.com/kien/premailer.vim
[5]: http://designtomarkup.com/vim/work-with-external-css-tools#cssbaseline.vim
