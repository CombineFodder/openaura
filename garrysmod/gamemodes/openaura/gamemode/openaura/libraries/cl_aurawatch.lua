--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

openAura.aurawatch = {};
openAura.aurawatch.stored = {};

-- A function to get all aurawatchs.
function openAura.aurawatch:GetAll()
	return self.stored;
end;

-- A function to get a new aurawatch.
function openAura.aurawatch:New()
	return {};
end;

-- A function to get an aurawatch.
function openAura.aurawatch:Get(name)
	return self.stored[name];
end;

-- A function to get the aurawatch panel.
function openAura.aurawatch:GetPanel()
	if ( IsValid(self.panel) ) then
		return self.panel;
	end;
end;

-- A function to rebuild an aurawatch.
function openAura.aurawatch:Rebuild(name)
	local panel = self:GetPanel();
	
	if (panel and self:GetActive() == name) then
		panel:Rebuild();
	end;
end;

-- A function to get the active aurawatch.
function openAura.aurawatch:GetActive()
	local panel = self:GetPanel();
	
	if (panel) then
		return panel.aurawatch;
	end;
end;

-- A function to set the active aurawatch.
function openAura.aurawatch:SetActive(name)
	local panel = self:GetPanel();
	
	if (panel) then
		panel.aurawatch = name;
		panel:Rebuild();
	end;
end;

-- A function to register a new aurawatch.
function openAura.aurawatch:Register(aurawatch)
	self.stored[aurawatch.name] = aurawatch;
	
	if (!aurawatch.HasAccess) then
		aurawatch.HasAccess = function(aurawatchTable)
			return openAura.player:HasFlags(openAura.Client, aurawatchTable.access);
		end;
	end;
	
	-- A function to get whether the aurawatch is active.
	aurawatch.IsActive = function(aurawatchTable)
		local activeAdmin = self:GetActive();
		
		if (activeAdmin == aurawatchTable.name) then
			return true;
		else
			return false;
		end;
	end;
	
	-- A function to rebuild the aurawatch.
	aurawatch.Rebuild = function(aurawatchTable)
		self:Rebuild(aurawatchTable.name);
	end;
end;