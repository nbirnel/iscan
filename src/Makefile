all : iscan_fns.ahk toolkit.ahk imacro.vim
	
iscan_fns.ahk : iscan_fns.raw.ahk header.m4
	m4 header.m4 iscan_fns.raw.ahk > iscan_fns.ahk
toolkit.ahk : toolkit.raw.ahk header.m4
	m4 header.m4 toolkit.raw.ahk > toolkit.ahk
imacro.vim : keybindings.ahk toolkit.raw.ahk DRIVER_TEMPLATE/scan_driver_template.ahk
	./kb2vim
