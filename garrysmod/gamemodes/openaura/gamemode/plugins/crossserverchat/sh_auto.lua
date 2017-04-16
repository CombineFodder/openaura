--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

PLUGIN.areaDisplays = {};
openAura:IncludePrefixed("sh_coms.lua");
openAura:IncludePrefixed("cl_hooks.lua");

openAura.config:ShareKey("cross_server_chatting");

-- A function to format a channel.
function openAura:FormatChannel(channel)
	if (string.sub(channel, 1, 1) != "#") then
		channel = "#"..channel;
	end;
	
	return string.gsub(string.lower(channel), "%s", "");
end;