function! NvuiNotify(name, ...)
	call call("rpcnotify", extend([1, a:name], a:000))
endfunction
function! s:complete_popup(arg, line, pos)
	return rpcrequest(1, 'NVUI_POPUPMENU_ICON_NAMES')
endfunction
function! s:complete_scaler(arg, line, pos)
	return rpcrequest(1, 'NVUI_SCALER_NAMES')
endfunction
function! s:get_dir()
	return fnamemodify(getcwd(), ':t')
endfunction
function! s:get_file()
	return expand('%:t')
endfunction
function! s:get_title()
	return join(split("nvui," . s:get_dir() . "," . s:get_file(), ","), g:nvui_tb_separator)
endfunction
command! -nargs=1 NvuiPopupMenuInfoColumns call rpcnotify(1, 'NVUI_PUM_INFO_COLS', <args>)
command! -nargs=1 NvuiScrollAnimationDuration call rpcnotify(1, 'NVUI_SCROLL_ANIMATION_DURATION', <args>)
command! -nargs=1 NvuiSnapshotLimit call rpcnotify(1, 'NVUI_SNAPSHOT_LIMIT', <args>)
command! -nargs=1 NvuiScrollFrametime call rpcnotify(1, 'NVUI_SCROLL_FRAMETIME', <args>)
command! -nargs=1 -complete=customlist,s:complete_scaler NvuiScrollScaler call NvuiNotify('NVUI_SCROLL_SCALER', <f-args>)
command! -nargs=1 -complete=customlist,s:complete_scaler NvuiMoveScaler call NvuiNotify('NVUI_MOVE_SCALER', <f-args>)
command! -nargs=1 -complete=customlist,s:complete_scaler NvuiCursorScaler call NvuiNotify('NVUI_CURSOR_SCALER', <f-args>)
command! -nargs=1 NvuiMoveAnimationFrametime call rpcnotify(1, 'NVUI_ANIMATION_FRAMETIME', <args>)
command! -nargs=1 NvuiAnimationsEnabled call rpcnotify(1, 'NVUI_ANIMATIONS_ENABLED', <args>)
command! -nargs=1 NvuiMoveAnimationDuration call rpcnotify(1, 'NVUI_MOVE_ANIMATION_DURATION', <args>)
command! -nargs=1 NvuiTitlebarBg call NvuiNotify('NVUI_TITLEBAR_BG', <f-args>)
command! -nargs=1 NvuiTitlebarFg call NvuiNotify('NVUI_TITLEBAR_FG', <f-args>)
command! -nargs=* NvuiTitlebarColors call NvuiNotify('NVUI_TITLEBAR_COLORS', <f-args>)
command! NvuiTitlebarUnsetColors call NvuiNotify('NVUI_TITLEBAR_UNSET_COLORS')
command! -nargs=1 NvuiTitlebarFontFamily call NvuiNotify('NVUI_TITLEBAR_FONT_FAMILY', <f-args>)
command! -nargs=1 NvuiTitlebarFontSize call rpcnotify(1, 'NVUI_TITLEBAR_FONT_SIZE', <args>)
command! -nargs=1 NvuiCaretExtendTop call rpcnotify(1, 'NVUI_CARET_EXTEND_TOP', <args>)
command! -nargs=1 NvuiCaretExtendBottom call rpcnotify(1, 'NVUI_CARET_EXTEND_BOTTOM', <args>)
command! -nargs=1 NvuiTitlebarSeparator call rpcnotify(1, 'NVUI_TB_SEPARATOR', <args>)
command! -nargs=* -complete=customlist,s:complete_popup NvuiPopupMenuIconFgBg call NvuiNotify('NVUI_PUM_ICON_COLORS', <f-args>)
command! -nargs=* -complete=customlist,s:complete_popup NvuiPopupMenuIconBg call NvuiNotify('NVUI_PUM_ICON_BG', <f-args>)
command! -nargs=* -complete=customlist,s:complete_popup NvuiPopupMenuIconFg call NvuiNotify('NVUI_PUM_ICON_FG', <f-args>)
command! -nargs=1 NvuiPopupMenuIconsRightAlign call rpcnotify(1, 'NVUI_PUM_ICONS_RIGHT', <args>)
command! -nargs=1 NvuiCmdPadding call rpcnotify(1, 'NVUI_CMD_PADDING', <args>)
command! -nargs=1 NvuiCmdCenterXPos call rpcnotify(1, 'NVUI_CMD_SET_CENTER_X', <args>)
command! -nargs=1 NvuiCmdCenterYPos call rpcnotify(1, 'NVUI_CMD_SET_CENTER_Y', <args>)
command! -nargs=1 NvuiCmdLeftPos call rpcnotify(1, 'NVUI_CMD_SET_LEFT', <args>)
command! -nargs=1 NvuiCmdTopPos call rpcnotify(1, 'NVUI_CMD_YPOS', <args>)
command! -nargs=1 NvuiCmdWidth call rpcnotify(1, 'NVUI_CMD_WIDTH', <args>)
command! -nargs=1 NvuiCmdHeight call rpcnotify(1, 'NVUI_CMD_HEIGHT', <args>)
command! -nargs=1 NvuiCmdFontSize call rpcnotify(1, 'NVUI_CMD_FONT_SIZE', <args>)
command! -nargs=1 NvuiCmdFontFamily call NvuiNotify('NVUI_CMD_FONT_FAMILY', <f-args>)
command! -nargs=1 NvuiCmdFg call NvuiNotify('NVUI_CMD_FG', <f-args>)
command! -nargs=1 NvuiCmdBg call NvuiNotify('NVUI_CMD_BG', <f-args>)
command! -nargs=1 NvuiCmdBorderWidth call rpcnotify(1, 'NVUI_CMD_BORDER_WIDTH', <args>)
command! -nargs=1 NvuiCmdBorderColor call NvuiNotify('NVUI_CMD_BORDER_COLOR', <f-args>)
command! -nargs=1 NvuiCmdBigFontScaleFactor call rpcnotify(1, 'NVUI_CMD_BIG_SCALE', <args>)
command! -nargs=1 NvuiPopupMenuDefaultIconFg call NvuiNotify('NVUI_PUM_DEFAULT_ICON_FG', <f-args>)
command! -nargs=1 NvuiPopupMenuDefaultIconBg call NvuiNotify('NVUI_PUM_DEFAULT_ICON_BG', <f-args>)
command! -nargs=1 NvuiPopupMenuIconSpacing call rpcnotify(1, 'NVUI_PUM_ICON_SPACING', <args>)
command! NvuiPopupMenuIconsToggle call rpcnotify(1, 'NVUI_PUM_ICONS_TOGGLE')
command! -nargs=1 NvuiPopupMenuIconOffset call rpcnotify(1, 'NVUI_PUM_ICON_OFFSET', <args>)
command! -nargs=1 NvuiPopupMenuBorderColor call NvuiNotify('NVUI_PUM_BORDER_COLOR', <f-args>)
command! -nargs=1 NvuiPopupMenuBorderWidth call rpcnotify(1, 'NVUI_PUM_BORDER_WIDTH', <args>)
command! -nargs=1 NvuiPopupMenuMaxChars call rpcnotify(1, 'NVUI_PUM_MAX_CHARS', <args>)
command! -nargs=1 NvuiPopupMenuMaxItems call rpcnotify(1, 'NVUI_PUM_MAX_ITEMS', <args>)
command! NvuiToggleFrameless call rpcnotify(1, 'NVUI_TOGGLE_FRAMELESS')
command! -nargs=1 NvuiOpacity call rpcnotify(1, 'NVUI_WINOPACITY', <args>)
command! -nargs=1 NvuiCharspace call rpcnotify(1, 'NVUI_CHARSPACE', <args>)
command! -nargs=1 NvuiFullscreen call rpcnotify(1, 'NVUI_FULLSCREEN', <args>)
command! NvuiToggleFullscreen call rpcnotify(1, 'NVUI_TOGGLE_FULLSCREEN')
command! -nargs=1 NvuiFrameless call rpcnotify(1, 'NVUI_FRAMELESS', <args>)
command! -nargs=1 NvuiCursorAnimationDuration call rpcnotify(1, 'NVUI_CURSOR_ANIMATION_DURATION', <args>)
command! -nargs=1 NvuiCursorFrametime call rpcnotify(1, 'NVUI_CURSOR_FRAMETIME', <args>)
command! -nargs=1 NvuiCursorHideWhileTyping call rpcnotify(1, 'NVUI_CURSOR_HIDE_TYPE', <args>)
function! NvuiGetTitle()
	return s:get_title()
endfunction
autocmd BufEnter * call rpcnotify(1, 'NVUI_TB_TITLE', NvuiGetTitle())
autocmd DirChanged * call rpcnotify(1, 'NVUI_TB_TITLE', NvuiGetTitle())
