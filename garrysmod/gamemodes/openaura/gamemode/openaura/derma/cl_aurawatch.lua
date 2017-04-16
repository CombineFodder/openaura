--[[
	© 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local PANEL = {};

-- Called when the panel is initialized.
function PANEL:Init()
	self:SetSize( openAura.menu:GetWidth(), openAura.menu:GetHeight() );
	self:SetTitle( openAura.option:GetKey("name_aurawatch") );
	self:SetSizable(false);
	self:SetDraggable(false);
	self:ShowCloseButton(false);
	
	self.panelList = vgui.Create("DPanelList", self);
 	self.panelList:SetPadding(2);
 	self.panelList:SetSpacing(3);
 	self.panelList:SizeToContents();
	self.panelList:EnableVerticalScrollbar();
	
	openAura.aurawatch.panel = self;
	
	self:Rebuild();
end;

-- A function to rebuild the panel.
function PANEL:Rebuild()
	self.panelList:Clear(true);
	
	if (self.aurawatch) then
		self.navigationForm = vgui.Create("DForm", self);
			self.navigationForm:SetPadding(4);
			self.navigationForm:SetName("Navigation");
		self.panelList:AddItem(self.navigationForm);
	
		local backButton = vgui.Create("DButton", self);
			backButton:SetText("Back to Navigation");
			backButton:SetWide( self:GetParent():GetWide() );
			
			-- Called when the button is clicked.
			function backButton.DoClick(button)
				self.aurawatch = nil;
				self:Rebuild();
			end;
		self.navigationForm:AddItem(backButton);
		
		local aurawatchTable = openAura.aurawatch:Get(self.aurawatch);
		
		if (aurawatchTable) then
			if (aurawatchTable.doesCreateForm) then
				self.aurawatchForm = vgui.Create("DForm", self);
					self.aurawatchForm:SetPadding(4);
					self.aurawatchForm:SetName(aurawatchTable.name);
				self.panelList:AddItem(self.aurawatchForm);
			end;
			
			aurawatchTable:OnDisplay(self, self.aurawatchForm);
		end;
	else
		local label = vgui.Create("aura_InfoText", self);
			label:SetText("The "..openAura.option:GetKey("name_aurawatch").." provides you with various tools.");
			label:SetInfoColor("blue");
		self.panelList:AddItem(label);
		
		for k, v in pairs( openAura.aurawatch:GetAll() ) do
			self.aurawatchCategoryForm = vgui.Create("DForm", self);
				self.aurawatchCategoryForm:SetPadding(4);
				self.aurawatchCategoryForm:SetName(v.name);
			self.panelList:AddItem(self.aurawatchCategoryForm);
			
			self.aurawatchCategoryForm:Help(v.toolTip);
			
			local aurawatchButton = vgui.Create("aura_InfoText", aurawatchPanel);
				aurawatchButton:SetText("Open");
				aurawatchButton:SetTextToLeft();
				
				if ( v:HasAccess() ) then
					aurawatchButton:SetButton(true);
					aurawatchButton:SetInfoColor("green");
					aurawatchButton:SetToolTip("Click here to open this AuraWatch panel.");
					
					-- Called when the button is clicked.
					function aurawatchButton.DoClick(button)
						self.aurawatch = v.name;
						self:Rebuild();
					end;
				else
					aurawatchButton:SetInfoColor("red");
					aurawatchButton:SetToolTip("You do not have access to this AuraWatch panel.");
				end;
				
				aurawatchButton:SetShowIcon(false);
			self.aurawatchCategoryForm:AddItem(aurawatchButton);
		end;
	end;
	
	self.panelList:InvalidateLayout(true);
end;

-- A function to get whether the button is visible.
function PANEL:IsButtonVisible()
	for k, v in pairs( openAura.aurawatch:GetAll() ) do
		if ( v:HasAccess() ) then
			return true;
		end;
	end;
end;

-- Called when the panel is selected.
function PANEL:OnSelected() self:Rebuild(); end;

-- Called when the layout should be performed.
function PANEL:PerformLayout()
	self.panelList:StretchToParent(4, 28, 4, 4);
	self:SetSize( self:GetWide(), math.min(self.panelList.pnlCanvas:GetTall() + 32, ScrH() * 0.75) );
	
	derma.SkinHook("Layout", "Frame", self);
end;

-- Called when the panel is painted.
function PANEL:Paint()
	derma.SkinHook("Paint", "Frame", self);
	
	return true;
end;

-- Called each frame.
function PANEL:Think()
	self:InvalidateLayout(true);
end;

vgui.Register("aura_AuraWatch", PANEL, "DFrame");