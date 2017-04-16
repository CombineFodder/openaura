--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

if (CLIENT) then
	AURAWATCH = openAura.aurawatch:New();
	AURAWATCH.name = "Manage Plugins";
	AURAWATCH.toolTip = "You can load and unload plugins from here.";
	AURAWATCH.doesCreateForm = false;
	
	-- Called to get whether the local player has access to the aurawatch.
	function AURAWATCH:HasAccess()
		local unloadTable = openAura.command:Get("PluginUnload");
		local loadTable = openAura.command:Get("PluginLoad");
		
		if (loadTable and unloadTable) then
			if ( openAura.player:HasFlags(openAura.Client, loadTable.access)
			or openAura.player:HasFlags(openAura.Client, unloadTable.access) ) then
				return true;
			end;
		end;
		
		return false;
	end;

	-- Called when the aurawatch should be displayed.
	function AURAWATCH:OnDisplay(aurawatchPanel, aurawatchForm)
		self.pluginButtons = {};
		
		local donePlugins = {};
		local categories = {};
		local mainPlugins = {};
		
		for k, v in pairs(openAura.plugin.stored) do
			if (v != openAura.schema) then
				categories[v.author] = categories[v.author] or {};
				categories[v.author][#categories[v.author] + 1] = v;
			end;
		end;
		
		for k, v in pairs(categories) do
			table.sort(v, function(a, b)
				return a.name < b.name;
			end);
			
			mainPlugins[#mainPlugins + 1] = {
				category = k,
				plugins = v
			};
		end;
		
		table.sort(mainPlugins, function(a, b)
			return a.category < b.category;
		end);
		
		openAura:StartDataStream("AuraWatchPluginGet", true);
		
		if (#mainPlugins > 0) then
			local label = vgui.Create("aura_InfoText", aurawatchPanel);
				label:SetText("Plugins colored red are unloaded.");
				label:SetInfoColor("red");
			aurawatchPanel.panelList:AddItem(label);
			
			local label = vgui.Create("aura_InfoText", aurawatchPanel);
				label:SetText("Plugins colored green are loaded.");
				label:SetInfoColor("green");
			aurawatchPanel.panelList:AddItem(label);
			
			local label = vgui.Create("aura_InfoText", aurawatchPanel);
				label:SetText("Plugins colored orange are disabled.");
				label:SetInfoColor("orange");
			aurawatchPanel.panelList:AddItem(label);
			
			for k, v in ipairs(mainPlugins) do
				local pluginForm = vgui.Create("DForm", aurawatchPanel);
				local panelList = vgui.Create("DPanelList", aurawatchPanel);
				
				for k2, v2 in pairs(v.plugins) do
					self.pluginButtons[v2.name] = vgui.Create("aura_InfoText", aurawatchPanel);
						self.pluginButtons[v2.name]:SetText(v2.name);
						self.pluginButtons[v2.name]:SetButton(true);
						self.pluginButtons[v2.name]:SetToolTip(v2.description);
					panelList:AddItem( self.pluginButtons[v2.name] );
					
					if ( openAura.plugin:IsDisabled(v2.name) ) then
						self.pluginButtons[v2.name]:SetInfoColor("orange");
						self.pluginButtons[v2.name]:SetButton(false);
					elseif ( openAura.plugin:IsUnloaded(v2.name) ) then
						self.pluginButtons[v2.name]:SetInfoColor("red");
					else
						self.pluginButtons[v2.name]:SetInfoColor("green");
					end;
					
					-- Called when the button is clicked.
					self.pluginButtons[v2.name].DoClick = function(button)
						if ( !openAura.plugin:IsDisabled(v2.name) ) then
							if ( openAura.plugin:IsUnloaded(v2.name) ) then
								openAura:StartDataStream( "AuraWatchPluginSet", {v2.name, false} );
							else
								openAura:StartDataStream( "AuraWatchPluginSet", {v2.name, true} );
							end;
						end;
					end;
				end;
				
				aurawatchPanel.panelList:AddItem(pluginForm);
				
				panelList:SetAutoSize(true);
				panelList:SetPadding(4);
				panelList:SetSpacing(4);
				
				pluginForm:SetName(v.category);
				pluginForm:AddItem(panelList);
				pluginForm:SetPadding(4);
			end;
		else
			local label = vgui.Create("aura_InfoText", aurawatchPanel);
				label:SetText("There are no plugins installed on the server.");
				label:SetInfoColor("red");
			aurawatchPanel.panelList:AddItem(label);
		end;
	end;
	
	-- A function to update the plugin buttons.
	function AURAWATCH:UpdatePluginButtons()
		for k, v in pairs(self.pluginButtons) do
			if ( openAura.plugin:IsDisabled(k) ) then
				v:SetInfoColor("orange");
				v:SetButton(false);
			elseif ( openAura.plugin:IsUnloaded(k) ) then
				v:SetInfoColor("red");
				v:SetButton(true);
			else
				v:SetInfoColor("green");
				v:SetButton(true);
			end;
		end;
	end;

	openAura.aurawatch:Register(AURAWATCH);
	
	openAura:HookDataStream("AuraWatchPluginGet", function(data)
		local aurawatchTable = openAura.aurawatch:Get("Manage Plugins");
		local unloaded = data;
		
		for k, v in pairs(openAura.plugin.stored) do
			if ( unloaded[v.folderName] ) then
				openAura.plugin:SetUnloaded(v.name, true);
			else
				openAura.plugin:SetUnloaded(v.name, false);
			end;
		end;
		
		if ( aurawatchTable and aurawatchTable:IsActive() ) then
			aurawatchTable:UpdatePluginButtons();
		end;
	end);
	
	openAura:HookDataStream("AuraWatchPluginSet", function(data)
		local aurawatchTable = openAura.aurawatch:Get("Manage Plugins");
		local plugin = openAura.plugin:Get( data[1] );
		
		if (plugin) then
			openAura.plugin:SetUnloaded( plugin.name, (data[2] == true) );
		end;
		
		if ( aurawatchTable and aurawatchTable:IsActive() ) then
			aurawatchTable:UpdatePluginButtons();
		end;
	end);
else
	openAura:HookDataStream("AuraWatchPluginGet", function(player, data)
		openAura:StartDataStream(player, "AuraWatchPluginGet", openAura.plugin.unloaded);
	end);
	
	openAura:HookDataStream("AuraWatchPluginSet", function(player, data)
		local unloadTable = openAura.command:Get("PluginLoad");
		local loadTable = openAura.command:Get("PluginLoad");
		
		if ( data[2] == true and (!loadTable or !openAura.player:HasFlags(player, loadTable.access) ) ) then
			return;
		elseif ( data[2] == false and (!unloadTable or !openAura.player:HasFlags(player, unloadTable.access) ) ) then
			return;
		elseif (type( data[2] ) != "boolean") then
			return;
		end;
		
		local plugin = openAura.plugin:Get( data[1] );
		
		if (plugin) then
			if ( !openAura.plugin:IsDisabled(plugin.name) ) then
				local success = openAura.plugin:SetUnloaded( plugin.name, data[2] );
				local recipients = {};
				
				if (success) then
					if ( data[2] ) then
						openAura.player:NotifyAll(player:Name().." has unloaded the "..plugin.name.." plugin for the next restart.");
					else
						openAura.player:NotifyAll(player:Name().." has loaded the "..plugin.name.." plugin for the next restart.");
					end;
					
					for k, v in ipairs( _player.GetAll() ) do
						if ( v:HasInitialized() ) then
							if ( openAura.player:HasFlags(v, loadTable.access)
							or openAura.player:HasFlags(v, unloadTable.access) ) then
								recipients[#recipients + 1] = v;
							end;
						end;
					end;
					
					if (#recipients > 0) then
						openAura:StartDataStream( recipients, "AuraWatchPluginSet", { plugin.name, data[2] } );
					end;
				elseif ( data[2] ) then
					openAura.player:Notify(player, "This plugin could not be unloaded!");
				else
					openAura.player:Notify(player, "This plugin could not be loaded!");
				end;
			else
				openAura.player:Notify(player, "This plugin depends on another plugin!");
			end;
		else
			openAura.player:Notify(player, "This plugin is not valid!");
		end;
	end);
end;