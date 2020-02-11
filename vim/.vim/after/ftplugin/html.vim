let g:runcmd='$BROWSER %'
setlocal makeprg=$BROWSER\ %
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2 
setlocal expandtab
setlocal foldmethod=indent
setlocal foldnestmax=5
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal omnifunc=xmlcomplete#CompleteTags
inoremap ,, ,
inoremap >< ><ESC>yF<o<Esc>pa<space><Esc>F<"hyt<space>ddo<Esc>"hpa><Esc>F<a/<Esc>O
inoremap ,cc <!--//--><Esc>0f/i<space><space><left>
inoremap ,cm <!--<Enter>//--><Esc>O
inoremap ,dd <div><Enter></div><Esc>O
inoremap ,dc <ESC>F"i<div class=<ESC>f";a><Enter></div><Esc>O
inoremap ,b <b></b><Esc>0f>a
inoremap ,b <b></b><Esc>0f>a
inoremap ,em <em></em><Esc>0f>a
inoremap ,1 <h1></h1><Esc>F>a
inoremap ,2 <h2></h2><Esc>F>a
inoremap ,3 <h3></h3><Esc>F>a
inoremap ,4 <h4></h4><Esc>F>a
inoremap ,5 <h5></h5><Esc>F>a
inoremap ,p <p></p><Esc>F>a
inoremap ,a <ESC>F"i<a<Space>href=<ESC>f";a></a><Esc>F>a
inoremap ,td <td></td><Esc>F>a
inoremap ,tr <tr></tr><Esc>F>a
inoremap ,th <th></th><Esc>F>a
inoremap ,tb <table><Enter></table><Esc>O
inoremap ,sc <script type="text/javascript"><Enter></script><Esc>O

inoremap &<space> &amp;<space>
inoremap && &
inoremap ,< &lt;<space>
inoremap ,> &gt;<space>
inoremap ,>= &le;<space>
inoremap ,>= &ge;<space>
inoremap ," &quot;<space>
inoremap ,' &apos;<space>
inoremap ,cp &copy;<space>
inoremap ,tm &trade;<space>
inoremap ,pnd &pound;<space>

inoremap á &aacute;
inoremap é &eacute;
inoremap í &iacute;
inoremap ó &oacute;
inoremap ú &uacute;
inoremap ä &auml;
inoremap ë &euml;
inoremap ï &iuml;
inoremap ö &ouml;
inoremap ü &uuml;
inoremap ã &atilde;
inoremap ẽ &etilde;
inoremap ĩ &itilde;
inoremap õ &otilde;
inoremap ũ &utilde;
inoremap ñ &ntilde;
inoremap à &agrave;
inoremap è &egrave;
inoremap ì &igrave;
inoremap ò &ograve;
inoremap ù &ugrave;
