function MenuManager:show_warning_mod(var)
	local dialog_data = {}
	dialog_data.title = "Overdrill Stealth"
	dialog_data.text = " This session has Overdrill Stealth Enabled, DONACDUM. \n This mod is 99% of DrNewbies code 1% of mine!"
	local ok_button = {}
	ok_button.text = managers.localization:text("dialog_ok")
	dialog_data.button_list = {ok_button}
	managers.system_menu:show(dialog_data)
end
