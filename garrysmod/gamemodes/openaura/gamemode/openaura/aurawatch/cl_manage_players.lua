--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

AURAWATCH = openAura.aurawatch:New();
AURAWATCH.name = "Manage Players";
AURAWATCH.toolTip = "Contains a set of useful commands to use players.";
AURAWATCH.doesCreateForm = false;

-- Called to get whether the local player has access to the aurawatch.
function AURAWATCH:HasAccess()
	return openAura.player:IsAdmin(openAura.Client);
end;

-- Called when the aurawatch should be displayed.
function AURAWATCH:OnDisplay(aurawatchPanel, aurawatchForm)
	local availableClasses = {};
	local classes = {};
	
	for k, v in ipairs( _player.GetAll() ) do
		if ( v:HasInitialized() ) then
			local class = openAura.plugin:Call("GetPlayerScoreboardClass", v);
			
			if (class) then
				if ( !availableClasses[class] ) then
					availableClasses[class] = {};
				end;
				
				availableClasses[class][#availableClasses[class] + 1] = v;
			end;
		end;
	end;
	
	for k, v in pairs(availableClasses) do
		table.sort(v, function(a, b)
			return openAura.plugin:Call("ScoreboardSortClassPlayers", k, a, b);
		end);
		
		if (#v > 0) then
			classes[#classes + 1] = {name = k, players = v};
		end;
	end;
	
	table.sort(classes, function(a, b)
		return a.name < b.name;
	end);
	
	if (table.Count(classes) > 0) then
		local label = vgui.Create("aura_InfoText", aurawatchPanel);
			label:SetText("Clicking on a player may bring up some options.");
			label:SetInfoColor("blue");
		aurawatchPanel.panelList:AddItem(label);
		
		for k, v in pairs(classes) do
			local characterForm = vgui.Create("DForm", aurawatchPanel);
			local panelList = vgui.Create("DPanelList", aurawatchPanel);
			
			for k2, v2 in pairs(v.players) do
				local label = vgui.Create("aura_InfoText", aurawatchPanel);
					label:SetText( v2:Name() );
					label:SetButton(true);
					label:SetToolTip("This player's name is "..v2:SteamName()..".\nThis player's Steam ID is "..v2:SteamID()..".");
					label:SetInfoColor( _team.GetColor( v2:Team() ) );
				panelList:AddItem(label);
				
				-- Called when the button is clicked.
				function label.DoClick(button)
					if ( IsValid(v2) ) then
						local options = {};
							openAura.plugin:Call("GetPlayerScoreboardOptions", v2, options);
						openAura:AddMenuFromData(nil, options);
					end;
				end;
			end;
			
			aurawatchPanel.panelList:AddItem(characterForm);
			
			panelList:SetAutoSize(true);
			panelList:SetPadding(4);
			panelList:SetSpacing(4);
			
			characterForm:SetName(v.name);
			characterForm:AddItem(panelList);
			characterForm:SetPadding(4); 
		end;
	else
		local label = vgui.Create("aura_InfoText", aurawatchPanel);
			label:SetText("There are no players to display.");
			label:SetInfoColor("orange");
		aurawatchPanel.panelList:AddItem(label);
	end;
end;

openAura.aurawatch:Register(AURAWATCH);