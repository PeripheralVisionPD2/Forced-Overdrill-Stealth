function isHost()
	if not Network then return false end
	return not Network:is_client()
end

function _boolsomething()
	if managers.network then
		if managers.network.matchmake:get_lobby_attributes() > 1 then
			return true
		end
	end
	return false
end

local _queue_dialog_orig = DialogManager.queue_dialog
function DialogManager:queue_dialog(id,...)
	_queue_dialog_orig(self,id,...)
	if _boolsomething() then
		if id == "Play_pln_fwb_01" then
			if managers.job:current_level_id() == "red2" or managers.groupai:state():whisper_mode() and Global.game_settings.difficulty == "overkill_290" and isHost() then
				for _, script in pairs(managers.mission:scripts()) do
					for id, element in pairs(script:elements()) do
						for _, trigger in pairs(element:values().trigger_list or {}) do
							if trigger.notify_unit_sequence == "light_on" then
								element:on_executed()
								managers.chat:_receive_message(1, "Overdrill Stealth", "Activated", Color.green) 
							end
						end
					end
				end
			else
				managers.chat:_receive_message(1, "Overdrill Stealth Activated", "Error, use Deathwish difficulty!", Color.yellow)
				managers.chat:_receive_message(1, "Requirements", "Deathwish Difficulty and Online Game.", Color.yellow)	
			end
		end
	end
end
