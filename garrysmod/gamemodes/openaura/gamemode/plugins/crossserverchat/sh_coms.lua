--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

COMMAND = openAura.command:New();
COMMAND.tip = "Set the channel for cross server chatting.";
COMMAND.text = "<string Channel>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if ( openAura.config:Get("cross_server_chatting"):Get() ) then
		local channel = openAura:FormatChannel( arguments[1] );
		openAura.player:Notify(player, "You have joined the out-of-character discussion channel "..channel..".");
		
		player:RunCommand("aura_xcs_channel", channel);
	else
		openAura.player:Notify(player, "Cross server chatting has been disabled by the administrator!");
	end;
end;

openAura.command:Register(COMMAND, "C");

COMMAND = openAura.command:New();
COMMAND.tip = "Talk in your cross server chatting channel.";
COMMAND.text = "<string Text>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local channel = player:GetInfo("aura_xcs_channel", "");
	local enabled = player:GetInfoNum("aura_xcs_enabled", 1);
	
	if ( openAura.config:Get("cross_server_chatting"):Get() ) then
		if (channel != "") then
			if (enabled != 0) then
				channel = openAura:FormatChannel( arguments[1] );
				
				umsg.Start("aura_XCS");
					umsg.String( arguments[1] );
				umsg.End();
			else
				openAura.player:Notify(player, "You have disabled cross server chatting in your settings!");
			end;
		else
			openAura.player:Notify(player, "You have not selected a channel to use yet!");
		end;
	else
		openAura.player:Notify(player, "Cross server chatting has been disabled by the administrator!");
	end;
end;

openAura.command:Register(COMMAND, "X");