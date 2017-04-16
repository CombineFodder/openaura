--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

if (CLIENT) then
	AURAWATCH = openAura.aurawatch:New();
	AURAWATCH.name = "Manage Config";
	AURAWATCH.toolTip = "An easier way of editing the OpenAura config.";
	AURAWATCH.doesCreateForm = false;
	
	-- Called to get whether the local player has access to the aurawatch.
	function AURAWATCH:HasAccess()
		local commandTable = openAura.command:Get("CfgSetVar");
		
		if ( commandTable and openAura.player:HasFlags(openAura.Client, commandTable.access) ) then
			return true;
		else
			return false;
		end;
	end;

	-- Called when the aurawatch should be displayed.
	function AURAWATCH:OnDisplay(aurawatchPanel, aurawatchForm)
		local adminValues = nil;
		
		self.infoText = vgui.Create("aura_InfoText", aurawatchPanel);
			self.infoText:SetText("Click on a config key to begin editing the config value.");
			self.infoText:SetInfoColor("blue");
		aurawatchPanel.panelList:AddItem(self.infoText);
		
		self.configForm = vgui.Create("DForm", aurawatchPanel);
			self.configForm:SetName("Config");
			self.configForm:SetPadding(4);
		aurawatchPanel.panelList:AddItem(self.configForm);
		
		if (!self.activeKey) then
			openAura:StartDataStream("AuraWatchCfgKeys", true);
		else
			adminValues = openAura.config:GetAuraWatch(self.activeKey.name);
			
			self.infoText:SetText("Now you can start to edit the config value, or click another config key.");
		end;
		
		self.comboBox = self.configForm:ComboBox("Key");
		self.comboBox:SetHeight(256);
		self.comboBox:SetMultiple(false);
		self:PopulateComboBox();
		
		if (adminValues) then
			self.configForm:SetName(self.activeKey.name);
			
			for k, v in ipairs( string.Explode("\n", adminValues.help) ) do
				self.configForm:Help(v);
			end;
			
			self.comboBox:SetText(self.activeKey.name);
			
			if (self.activeKey.value != nil) then
				local mapEntry = self.configForm:TextEntry("Map");
				local valueType = type(self.activeKey.value);
				
				if (valueType == "string") then
					local textEntry = self.configForm:TextEntry("Value");
						textEntry:SetValue(self.activeKey.value);
					local okayButton = self.configForm:Button("Okay");
						
					-- Called when the button is clicked.
					function okayButton.DoClick(okayButton)
						openAura:StartDataStream( "AuraWatchCfgSet", {
							key = self.activeKey.name,
							value = textEntry:GetValue(),
							useMap = mapEntry:GetValue()
						} );
					end;
				elseif (valueType == "number") then
					local numSlider = self.configForm:NumSlider("Value", nil, adminValues.minimum,
					adminValues.maximum, adminValues.decimals);
						numSlider:SetValue(self.activeKey.value);
					local okayButton = self.configForm:Button("Okay");
						
					-- Called when the button is clicked.
					function okayButton.DoClick(okayButton)
						openAura:StartDataStream( "AuraWatchCfgSet", {
							key = self.activeKey.name,
							value = numSlider:GetValue(),
							useMap = mapEntry:GetValue()
						} );
					end;
				elseif (valueType == "boolean") then
					local checkBox = self.configForm:CheckBox("On");
						checkBox:SetValue(self.activeKey.value);
					local okayButton = self.configForm:Button("Okay");
						
					-- Called when the button is clicked.
					function okayButton.DoClick(okayButton)
						openAura:StartDataStream( "AuraWatchCfgSet", {
							key = self.activeKey.name,
							value = checkBox:GetChecked(),
							useMap = mapEntry:GetValue()
						} );
					end;
				end;
			end;
		end;
	end;
	
	-- A function to populate the aurawatch's combo box.
	function AURAWATCH:PopulateComboBox()
		if (self.configKeys) then
			local defaultConfigItem = nil;
			
			for k, v in ipairs(self.configKeys) do
				local adminValues = openAura.config:GetAuraWatch(v);
				
				if (adminValues) then
					local comboBoxItem = self.comboBox:AddItem(v);
						comboBoxItem:SetToolTip(adminValues.help);
						
					-- Called when the combo box item is clicked.
					function comboBoxItem.DoClick(comboBoxItem)
						openAura:StartDataStream("AuraWatchCfgValue", v);
					end;
					
					if (self.activeKey and self.activeKey.name == v) then
						defaultConfigItem = comboBoxItem;
					end;
				end;
			end;
			
			if (defaultConfigItem) then
				self.comboBox:SelectItem(defaultConfigItem, true);
			end;
		end;
	end;

	openAura.aurawatch:Register(AURAWATCH);
	
	openAura:HookDataStream("AuraWatchCfgKeys", function(data)
		local aurawatchTable = openAura.aurawatch:Get("Manage Config");
		
		if (aurawatchTable) then
			aurawatchTable.configKeys = data;
			aurawatchTable:PopulateComboBox();
		end;
	end);
	
	openAura:HookDataStream("AuraWatchCfgValue", function(data)
		local aurawatchTable = openAura.aurawatch:Get("Manage Config");
		
		if (aurawatchTable) then
			aurawatchTable.activeKey = { name = data[1], value = data[2] };
			aurawatchTable:Rebuild();
		end;
	end);
else
	openAura:HookDataStream("AuraWatchCfgSet", function(player, data)
		local commandTable = openAura.command:Get("CfgSetVar");
		
		if ( commandTable and openAura.player:HasFlags(player, commandTable.access) ) then
			local configObject = openAura.config:Get(data.key);
			
			if ( configObject:IsValid() ) then
				local keyPrefix = "";
				local useMap = data.useMap;
				
				if (useMap == "") then
					useMap = nil;
				end;
				
				if (useMap) then
					useMap = string.lower( openAura:Replace(useMap, ".bsp", "") );
					keyPrefix = useMap.."'s ";
					
					if ( !file.Exists("maps/"..useMap..".bsp", true) ) then
						openAura.player:Notify(player, useMap.." is not a valid map!");
						
						return;
					end;
				end;
				
				if ( !configObject:Query("isStatic") ) then
					value = configObject:Set(data.value, useMap);
					
					if (value != nil) then
						local printValue = tostring(value);
						
						if ( configObject:Query("isPrivate") ) then
							if ( configObject:Query("needsRestart") ) then
								openAura.player:NotifyAll(player:Name().." set "..keyPrefix..data.key.." to '"..string.rep( "*", string.len(printValue) ).."' for the next restart.");
							else
								openAura.player:NotifyAll(player:Name().." set "..keyPrefix..data.key.." to '"..string.rep( "*", string.len(printValue) ).."'.");
							end;
						elseif ( configObject:Query("needsRestart") ) then
							openAura.player:NotifyAll(player:Name().." set "..keyPrefix..data.key.." to '"..printValue.."' for the next restart.");
						else
							openAura.player:NotifyAll(player:Name().." set "..keyPrefix..data.key.." to '"..printValue.."'.");
						end;
						
						openAura:StartDataStream( player, "AuraWatchCfgValue", { data.key, configObject:Get() } );
					else
						openAura.player:Notify(player, data.key.." was unable to be set!");
					end;
				else
					openAura.player:Notify(player, data.key.." is a static config key!");
				end;
			else
				openAura.player:Notify(player, data.key.." is not a valid config key!");
			end;
		end;
	end);
	
	openAura:HookDataStream("AuraWatchCfgKeys", function(player, data)
		local configKeys = {};
		
		for k, v in pairs( openAura.config:GetStored() ) do
			if (!v.isStatic) then
				configKeys[#configKeys + 1] = k;
			end;
		end;
		
		table.sort(configKeys, function(a, b)
			return a < b;
		end);
		
		openAura:StartDataStream(player, "AuraWatchCfgKeys", configKeys);
	end);
	
	openAura:HookDataStream("AuraWatchCfgValue", function(player, data)
		local configObject = openAura.config:Get(data);
		
		if ( configObject:IsValid() ) then
			if ( type( configObject:Get() ) == "string" and configObject:Query("isPrivate") ) then
				openAura:StartDataStream( player, "AuraWatchCfgValue", {data, "****"} );
			else
				openAura:StartDataStream( player, "AuraWatchCfgValue", {
					data, configObject:GetNext( configObject:Get() )
				} );
			end;
		end;
	end);
end;