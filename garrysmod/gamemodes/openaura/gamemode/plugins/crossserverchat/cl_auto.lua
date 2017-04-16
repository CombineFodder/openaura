--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

openAura:IncludePrefixed("sh_auto.lua");

openAura.config:AddAuraWatch("cross_server_chatting", "Whether or not cross server chatting is allowed.");

openAura.setting:AddCheckBox("Cross Server Chat", "Enable chatting across servers.", "aura_xcs_enabled", "Whether or not cross server chatting is enabled.", function()
	return openAura.config:Get("cross_server_chatting"):Get();
end);
openAura.setting:AddTextEntry("Cross Server Chat", "Set your cross server chatting channel.", "aura_xcs_channel", "The channel to use for cross server chatting.", function()
	return openAura.config:Get("cross_server_chatting"):Get();
end);

usermessage.Hook("aura_XCS", function(msg)
	local text = openAura:URLEncode( msg:ReadString() );
	local name = openAura:URLEncode( openAura.Client:SteamName() );
	local channel = openAura:URLEncode( NX_CONVAR_XSC_CHANNEL:GetString() );
	
	if (channel != "" and name != "" and text != "") then
		http.Get("http://kurozael.com/openaura/send.php?n="..name.."&t="..text.."&c="..channel, "", function(contents, size) end);
	end;
end);

-- A function to query the server for new chat.
function PLUGIN:QueryChat()
	local channel = NX_CONVAR_XSC_CHANNEL:GetString();
	local enabled = NX_CONVAR_XSC_ENABLED:GetInt();
	local currentKey = "";
	
	if (self.currentKey) then
		currentKey = "&k="..self.currentKey;
	end;
	
	if (openAura.config:Get("cross_server_chatting"):Get() and channel != "" and enabled != 0) then
		http.Get("http://kurozael.com/openaura/receive.php?c="..openAura:URLEncode(channel)..currentKey, "", function(contents, size)
			if (contents != "") then
				contents = Json.Decode(contents);
				
				for k, v in pairs( contents["chat"] ) do
					openAura.chatBox:Add(nil, "gui/silkicons/comment", Color(225, 75, 150, 255), "[XSC] ", k..": "..v);
				end;
				
				self.currentKey = contents["key"];
			end;
		end);
	end;
end;