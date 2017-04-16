--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PLUGIN = PLUGIN;

-- Called when the client initializes.
function PLUGIN:Initialize()
	NX_CONVAR_XSC_CHANNEL = openAura:CreateClientConVar("aura_xcs_channel", "", true, true);
	NX_CONVAR_XSC_ENABLED = openAura:CreateClientConVar("aura_xcs_enabled", 1, true, true);
end;

-- Called each tick.
function PLUGIN:Tick()
	if ( IsValid(openAura.Client) ) then
		local curTime = UnPredictedCurTime();
		
		if ( openAura.Client:HasInitialized() and (!self.nextQueryChat or curTime >= self.nextQueryChat) ) then
			self.nextQueryChat = curTime + 1;
			self:QueryChat();
		end;
	end;
end;

-- Called when a OpenAura ConVar has changed.
function PLUGIN:OpenAuraConVarChanged(name, previousValue, newValue)
	if (name == "aura_xcs_channel") then
		local channel = self:FormatChannel(newValue);
		
		if (newValue != channel) then
			RunConsoleCommand("aura_xcs_channel", channel);
		end;
	end;
end;