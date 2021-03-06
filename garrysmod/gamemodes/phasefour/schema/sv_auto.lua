--[[
	� 2011 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

openAura:IncludePrefixed("sh_auto.lua");

resource.AddFile("materials/models/weapons/temptexture/handsmesh1.vtf");
resource.AddFile("materials/models/weapons/temptexture/handsmesh1.vmt");
resource.AddFile("models/weapons/v_sledgehammer/v_sledgehammer.mdl");
resource.AddFile("materials/models/props_lab/exp_objects01.vtf");
resource.AddFile("materials/models/props_lab/exp_objects01.vmt");
resource.AddFile("materials/models/items/ammocrate_safebox.vtf");
resource.AddFile("materials/models/items/ammocrate_safebox.vmt");
resource.AddFile("materials/models/items/itemcrate_exper.vtf");
resource.AddFile("materials/models/items/itemcrate_exper.vmt");
resource.AddFile("models/humans/group03/male_experim.mdl");
resource.AddFile("materials/models/weapons/v_katana/katana.vtf");
resource.AddFile("materials/models/weapons/v_katana/katana.vmt");
resource.AddFile("models/items/ammocrate_safebox.mdl");
resource.AddFile("models/items/item_item_exper.mdl");
resource.AddFile("materials/victories/achieved.vtf");
resource.AddFile("materials/victories/achieved.vmt");
resource.AddFile("materials/augments/purchased.vtf");
resource.AddFile("materials/augments/purchased.vmt");
resource.AddFile("models/weapons/v_shovel/v_shovel.mdl");
resource.AddFile("models/weapons/v_axe/v_axe.mdl");
resource.AddFile("materials/models/weapons/sledge.vtf");
resource.AddFile("materials/models/weapons/sledge.vmt");
resource.AddFile("materials/models/weapons/shovel.vtf");
resource.AddFile("materials/models/weapons/shovel.vmt");
resource.AddFile("materials/models/weapons/axe.vtf");
resource.AddFile("materials/models/weapons/axe.vmt");
resource.AddFile("models/weapons/w_sledgehammer.mdl");
resource.AddFile("materials/phasefour/bg_gradient.vtf");
resource.AddFile("materials/phasefour/bg_gradient.vmt");
resource.AddFile("materials/phasefour/scratch.vtf");
resource.AddFile("materials/phasefour/scratch.vmt");
resource.AddFile("materials/phasefour/dirty.vtf");
resource.AddFile("materials/phasefour/dirty.vmt");
resource.AddFile("resource/fonts/sohoma.ttf");
resource.AddFile("models/pmc/pmc_4/pmc__07.mdl");
resource.AddFile("models/props_lab/exp01a.mdl");
resource.AddFile("models/weapons/w_katana.mdl");
resource.AddFile("models/weapons/v_katana.mdl");
resource.AddFile("models/weapons/w_shovel.mdl");
resource.AddFile("models/tactical_rebel.mdl");
resource.AddFile("models/weapons/w_axe.mdl");
resource.AddFile("models/riot_ex2.mdl");
resource.AddFile("models/sprayca2.mdl");
resource.AddFile("models/spx7.mdl");
resource.AddFile("models/spx2.mdl");
resource.AddFile("models/spex.mdl");

for k, v in pairs( _file.Find("materials/models/player/slow/aot/salem/*.*", true) ) do
	resource.AddFile("materials/models/player/slow/aot/salem/"..v);
end;

for k, v in pairs( _file.Find("materials/models/player/slow/napalm_atc/*.*", true) ) do
	resource.AddFile("materials/models/player/slow/napalm_atc/"..v);
end;

for k, v in pairs( _file.Find("materials/models/player/slow/nailgunner/*.*", true) ) do
	resource.AddFile("materials/models/player/slow/nailgunner/"..v);
end;

for k, v in pairs( _file.Find("materials/models/player/slow/bio_suit/*.*", true) ) do
	resource.AddFile("materials/models/player/slow/bio_suit/"..v);
end;

for k, v in pairs( _file.Find("materials/models/humans/male/group01/labcit*.*", true) ) do
	resource.AddFile("materials/models/humans/male/group01/"..v);
end;

for k, v in pairs( _file.Find("materials/models/humans/female/group01/labcit*.*", true) ) do
	resource.AddFile("materials/models/humans/female/group01/"..v);
end;

for k, v in pairs( _file.Find("materials/models/humans/male/experim/*.*", true) ) do
	resource.AddFile("materials/models/humans/male/experim/"..v);
end;

for k, v in pairs( _file.Find("materials/models/player/riex/*.*", true) ) do
	resource.AddFile("materials/models/player/riex/"..v);
end;

for k, v in pairs( _file.Find("materials/models/pmc/pmc_shared/*.*", true) ) do
	resource.AddFile("materials/models/pmc/pmc_shared/"..v);
end;

for k, v in pairs( _file.Find("materials/models/gasmask/tac_rbe/*.*", true) ) do
	resource.AddFile("materials/models/gasmask/tac_rbe/"..v);
end;

for k, v in pairs( _file.Find("materials/models/kevlarvest/*.*", true) ) do
	resource.AddFile("materials/models/kevlarvest/"..v);
end;

for k, v in pairs( _file.Find("materials/models/stalker/sx/*.*", true) ) do
	resource.AddFile("materials/models/stalker/sx/"..v);
end;

for k, v in pairs( _file.Find("materials/models/stalker/mx/*.*", true) ) do
	resource.AddFile("materials/models/stalker/mx/"..v);
end;

for k, v in pairs( _file.Find("materials/models/stalker/fx/*.*", true) ) do
	resource.AddFile("materials/models/stalker/fx/"..v);
end;

for k, v in pairs( _file.Find("materials/models/stalker/dx/*.*", true) ) do
	resource.AddFile("materials/models/stalker/dx/"..v);
end;

for k, v in pairs( _file.Find("materials/models/banditv/*.*", true) ) do
	resource.AddFile("materials/models/banditv/"..v);
end;

for k, v in pairs( _file.Find("materials/models/pmc/pmc_4/*.*", true) ) do
	resource.AddFile("materials/models/pmc/pmc_4/"..v);
end;

for k, v in pairs( _file.Find("materials/models/h3_spartan/*.*", true) ) do
	resource.AddFile("materials/models/h3_spartan/"..v);
end;

for k, v in pairs( _file.Find("models/humans/group60/*.mdl", true) ) do
	resource.AddFile("models/humans/group60/"..v);
end;

for k, v in pairs( _file.Find("models/humans/group61/*.mdl", true) ) do
	resource.AddFile("models/humans/group61/"..v);
end;

for k, v in pairs( _file.Find("models/humans/group62/*.mdl", true) ) do
	resource.AddFile("models/humans/group62/"..v);
end;

for k, v in pairs( _file.Find("models/kevlarvest/*.mdl", true) ) do
	resource.AddFile("models/kevlarvest/"..v);
end;

for k, v in pairs( _file.Find("materials/victories/*.*", true) ) do
	resource.AddFile("materials/victories/"..v);
end;

for k, v in pairs( _file.Find("models/napalm_atc/*.mdl", true) ) do
	resource.AddFile("models/napalm_atc/"..v);
end;

for k, v in pairs( _file.Find("models/nailgunner/*.mdl", true) ) do
	resource.AddFile("models/nailgunner/"..v);
end;

for k, v in pairs( _file.Find("materials/augments/*.*", true) ) do
	resource.AddFile("materials/augments/"..v);
end;

for k, v in pairs( _file.Find("models/salem/*.mdl", true) ) do
	resource.AddFile("models/salem/"..v);
end;

for k, v in pairs( _file.Find("models/bio_suit/*.mdl", true) ) do
	resource.AddFile("models/bio_suit/"..v);
end;

for k, v in pairs( _file.Find("models/srp/*.mdl", true) ) do
	resource.AddFile("models/srp/"..v);
end;

openAura.config:Add("intro_text_small", "You find it's just as screwed up outside.", true);
openAura.config:Add("intro_text_big", "WHEN YOU LEAVE THE CONFINES OF THE LAB", true);
openAura.config:Add("alliance_cost", 2000, true);

openAura.config:Get("scale_attribute_progress"):Set(0.5);
openAura.config:Get("enable_gravgun_punt"):Set(false);
openAura.config:Get("default_inv_weight"):Set(8);
openAura.config:Get("armor_chest_only"):Set(false);
openAura.config:Get("enable_crosshair"):Set(false);
openAura.config:Get("minimum_physdesc"):Set(16);
openAura.config:Get("scale_prop_cost"):Set(0.2);
openAura.config:Get("scale_head_dmg"):Set(2);
openAura.config:Get("disable_sprays"):Set(false);
openAura.config:Get("wages_interval"):Set(360);
openAura.config:Get("default_cash"):Set(120);

openAura.hint:Add("Admins", "The admins are here to help you, please respect them.");
openAura.hint:Add("Grammar", "Try to speak correctly in-character, and don't use emoticons.");
openAura.hint:Add("Healing", "You can heal players by using the Give command in your belongings.");
openAura.hint:Add("Healing", "You will gain honor for healing good characters with medical equipment.");
openAura.hint:Add("Zip Tie", "Press F3 while looking at a character to use a zip tie.");
openAura.hint:Add("Alliance", "You can create an alliance by using the command $command_prefix$AllyCreate.");
openAura.hint:Add("F4 Hotkey", "Press F4 to open up the hotkey menu, you can bind hotkeys in your belongings.");
openAura.hint:Add("Search Char", "Press F3 while looking at a tied character to search them.");

openAura:HookDataStream("JoinAlliance", function(player, data)
	if (player.allianceAuthenticate == data) then
		local alliances = player:GetTempData("alliances");
		
		if (!alliances) then
			player:SetTempData( "alliances", {} );
			alliances = player:GetTempData("alliances");
		end;
		
		player:SetRank(RANK_RCT);
		player:SetAlliance(data);
		
		if ( !alliances[data] and IsValid(player.allianceInviter) ) then
			openAura.victories:Progress(player.allianceInviter, VIC_THEDON);
			openAura.victories:Progress(player.allianceInviter, VIC_CONFEDERACY);
			alliances[data] = true;
		end;
		
		openAura.player:Notify(player, "You have joined the '"..data.."' alliance.");
	end;
end);

openAura:HookDataStream("Notepad", function(player, data)
	if ( type(data) == "string" and player:HasItem("notepad") ) then
		player:SetCharacterData( "notepad", string.sub(data, 0, 500) );
	end;
end);

openAura:HookDataStream("SetTitle", function(player, data)
	if (type(data) == "string") then
		local victoryTable = openAura.victory:Get(data);
		
		if (victoryTable and victoryTable.unlockTitle) then
			if ( openAura.victories:Has(player, data) ) then
				player:SetCharacterData("title", victoryTable.uniqueID);
				openAura.player:Notify(player, "You have set your title to "..string.Replace( victoryTable.unlockTitle, "%n", player:Name() )..".");
			end;
		end;
	end;
end);

openAura:HookDataStream("UpgradeWeapon", function(player, data)
	if (type(data) == "string") then
		local itemTable = openAura.item:Get(data);
		
		if (itemTable and itemTable.weaponLevel and itemTable.nextWeaponID) then
			if (player:HasItem(itemTable.uniqueID) and itemTable.weaponLevel != 10) then
				local engRequired = math.floor( math.Clamp(itemTable.weaponLevel * 5, 0, 50) );
				local engineering = openAura.attributes:Fraction(player, ATB_ENGINEERING, 50, 50);
				local cost = itemTable.weaponLevel * 500;
				
				if (engineering < engRequired) then
					openAura.player:Notify(player, "You need an engineering level of "..( (100 / 50) * engRequired ).."% to upgrade this!");
				elseif ( !openAura.player:CanAfford(player, cost) ) then
					openAura.player:Notify(player, "You need another "..FORMAT_CASH(cost - openAura.player:GetCash(player), nil, true).."!");
				else
					openAura.player:GiveCash(player, -cost, "upgrading a weapon");
					openAura.player:Notify(player, "You have upgraded this weapon to level "..(itemTable.weaponLevel + 1)..".");
					
					player:UpdateInventory(itemTable.nextWeaponID, 1, true, true);
					player:UpdateInventory(itemTable.uniqueID, -1, true, true);
				end;
			end;
		end;
	end;
end);

openAura:HookDataStream("UpgradeArmor", function(player, data)
	if (type(data) == "string") then
		local itemTable = openAura.item:Get(data);
		
		if (itemTable and itemTable.armorLevel and itemTable.nextArmorID) then
			if (player:HasItem(itemTable.uniqueID) and itemTable.armorLevel != 10) then
				local engRequired = math.floor( math.Clamp(itemTable.armorLevel * 5, 0, 50) );
				local engineering = openAura.attributes:Fraction(player, ATB_ENGINEERING, 50, 50);
				local cost = itemTable.armorLevel * 500;
				
				if (engineering < engRequired) then
					openAura.player:Notify(player, "You need an engineering level of "..( (100 / 50) * engRequired ).."% to upgrade this!");
				elseif ( !openAura.player:CanAfford(player, cost) ) then
					openAura.player:Notify(player, "You need another "..FORMAT_CASH(cost - openAura.player:GetCash(player), nil, true).."!");
				else
					openAura.player:GiveCash(player, -cost, "upgrading some armor");
					openAura.player:Notify(player, "You have upgraded this armor to level "..(itemTable.armorLevel + 1)..".");
					
					player:UpdateInventory(itemTable.nextArmorID, 1, true, true);
					player:UpdateInventory(itemTable.uniqueID, -1, true, true);
				end;
			end;
		end;
	end;
end);

openAura:HookDataStream("BountyAdd", function(player, data)
	openAura.player:RunOpenAuraCommand( player, "Bounty", tostring(data.name), tostring(data.bounty) );
end);

openAura:HookDataStream("GetAugment", function(player, data)
	local augmentTable = openAura.augment:Get(data);
	
	if (augmentTable) then
		if ( openAura.player:CanAfford(player, augmentTable.cost) ) then
			if ( !openAura.augments:Has(player, augmentTable.uniqueID) ) then
				openAura.augments:Give(player, augmentTable.uniqueID);
				
				openAura.player:GiveCash(player, -augmentTable.cost, augmentTable.name);
				openAura.player:Notify(player, "You have gotten the '"..augmentTable.name.."' augment.");
			end;
		else
			openAura.player:Notify(player, "You need another "..FORMAT_CASH(augmentTable.cost - openAura.player:GetCash(player), nil, true).."!");
		end;
	end;
end);

openAura:HookDataStream("AllyKick", function(player, data)
	if ( player:IsLeader() and IsValid(data) and !data:IsLeader() ) then
		local alliance = player:GetAlliance();
		
		if ( alliance == data:GetAlliance() ) then
			data:SetRank(RANK_RCT);
			data:SetAlliance("");
			
			openAura.player:Notify(player, "You have kicked "..data:Name().." from the '"..alliance.."' alliance.");
			openAura.player:Notify(data, player:Name().." has kicked you from the '"..alliance.."' alliance.");
		
			openAura:StartDataStream(player, "AllyKick", data);
		end;
	end;
end);

openAura:HookDataStream("AllyMakeLeader", function(player, data)
	if ( player:IsLeader() and IsValid(data) and !data:IsLeader() ) then
		local alliance = player:GetAlliance();
		
		if ( alliance == data:GetAlliance() ) then
			data:SetRank(RANK_MAJ);
			
			openAura.player:Notify(player, "You have made "..data:Name().." a leader of the '"..alliance.."' alliance.");
			openAura.player:Notify(data, player:Name().." has made you a leader of the '"..alliance.."' alliance.");
		
			openAura:StartDataStream( player, "AllySetRank", {data, RANK_MAJ} );
		end;
	end;
end);

openAura:HookDataStream("AllySetRank", function(player, data)
	if ( player:IsLeader() and IsValid( data[1] ) and !data[1]:IsLeader() ) then
		if ( player:GetAlliance() == data[1]:GetAlliance() ) then
			local rank = tonumber( data[2] );
			
			if (rank and rank >= 0 and rank < 5) then
				data[1]:SetRank(rank);
				
				openAura.player:Notify(player, "You have set "..data[1]:Name().."'s rank to "..data[1]:GetRank(true)..".");
				openAura.player:Notify(data[1], player:Name().." has set your rank within the alliance to "..data[1]:GetRank(true)..".");
			
				openAura:StartDataStream(player, "AllySetRank", data);
			end;
		end;
	end;
end);

openAura:HookDataStream("CreateAlliance", function(player, data)
	if (type(data) == "string") then
		local charactersTable = openAura.config:Get("mysql_characters_table"):Get();
		local schemaFolder = openAura:GetSchemaFolder();
		local alliance = tmysql.escape( string.gsub(string.sub(data, 1, 32), "[%p%d]", "") );
		
		tmysql.query("SELECT * FROM "..charactersTable.." WHERE _Schema = \""..schemaFolder.."\" AND _Data LIKE \"%\\\"alliance\\\":\\\""..alliance.."\\\"\"%", function(result)
			if ( IsValid(player) ) then
				local allianceCost = openAura.config:Get("alliance_cost"):Get();
				
				if (result and type(result) == "table" and #result > 0) then
					openAura.player:Notify(player, "An alliance with the name '"..alliance.."' already exists!");
				elseif ( openAura.player:CanAfford(player, allianceCost) ) then
					player:SetRank(RANK_MAJ);
					player:SetAlliance(alliance);
					
					openAura.player:GiveCash(player, -allianceCost, "creating an alliance");
					openAura.player:Notify(player, "You have created the '"..alliance.."' alliance.");
				else
					openAura.player:Notify(player, "You need another "..FORMAT_CASH(allianceCost - openAura.player:GetCash(player), nil, true).."!");
				end;
			end;
		end, 1);
	end;
end);

local playerMeta = FindMetaTable("Player");

-- A function to get whether a player is good.
function playerMeta:IsGood()
	return self:GetCharacterData("honor") >= 50;
end;

-- A function to get whether a player is bad.
function playerMeta:IsBad()
	return self:GetCharacterData("honor") < 50;
end;

-- A function to get a player's bounty.
function playerMeta:GetBounty()
	return self:GetCharacterData("bounty");
end;

-- A function to get whether a player is wanted.
function playerMeta:IsWanted()
	return self:GetCharacterData("bounty") > 0;
end;

-- A function to add to a player's bounty.
function playerMeta:AddBounty(bounty)
	self:SetCharacterData("bounty", self:GetCharacterData("bounty") + bounty);
end;

-- A function to remove a player's bounty.
function playerMeta:RemoveBounty()
	self:SetCharacterData("bounty", 0);
end;

-- A function to handle a player's honor.
function playerMeta:HandleHonor(honor)
	if ( honor < 0 and openAura.augments:Has(self, AUG_CURSED) ) then
		honor = honor * 2;
	elseif ( honor > 0 and openAura.augments:Has(self, AUG_FAVORED) ) then
		honor = honor * 2;
	end;
	
	self:SetCharacterData( "honor", math.Clamp(self:GetCharacterData("honor") + honor, 0, 100) );
	
	if (self:GetCharacterData("honor") == 100) then
		openAura.victories:Progress(self, VIC_ANGELIC);
	elseif (self:GetCharacterData("honor") == 0) then
		openAura.victories:Progress(self, VIC_INCARNATE);
	end;
end;

-- A function to get whether a player is a leader.
function playerMeta:IsLeader()
	return self:GetCharacterData("rank") == RANK_MAJ;
end;

-- A function to set a player's rank.
function playerMeta:SetRank(rank)
	self:SetCharacterData("rank", rank);
	self:SetSharedVar("rank", rank);
end;

-- A function to set a player's alliance.
function playerMeta:SetAlliance(alliance)
	self:SetCharacterData("alliance", alliance);
	self:SetSharedVar("alliance", alliance);
end;

-- A function to get a player's alliance.
function playerMeta:GetAlliance()
	local alliance = self:GetCharacterData("alliance");
	
	if (alliance != "") then
		return alliance;
	end;
end;

-- A function to get a player's rank.
function playerMeta:GetRank(bString)
	local rank = self:GetCharacterData("rank");
	
	if (bString) then
		if (rank == RANK_PVT) then
			return "Pvt";
		elseif (rank == RANK_SGT) then
			return "Sgt";
		elseif (rank == RANK_LT) then
			return "Lt";
		elseif (rank == RANK_CPT) then
			return "Cpt";
		elseif (rank == RANK_MAJ) then
			return "Maj";
		else
			return "Rct";
		end;
	else
		return rank;
	end;
end;

-- A function to make an explosion.
function openAura.schema:MakeExplosion(position, scale)
	local explosionEffect = EffectData();
	local smokeEffect = EffectData();
	
	explosionEffect:SetOrigin(position);
	explosionEffect:SetScale(scale);
	smokeEffect:SetOrigin(position);
	smokeEffect:SetScale(scale);
	
	util.Effect("explosion", explosionEffect, true, true);
	util.Effect("aura_effect_smoke", smokeEffect, true, true);
end;

-- A function to spawn a flash.
function openAura.schema:SpawnFlash(position)
	local effectData = EffectData();
	local curTime = CurTime();
	
	effectData:SetStart(position);
	effectData:SetOrigin(position);
	effectData:SetScale(16);
	
	util.Effect("Explosion", effectData, true, true);
	
	local effectData = EffectData();
		effectData:SetOrigin(position);
		effectData:SetScale(2);
	util.Effect("aura_effect_smoke", effectData, true, true);
	
	for k, v in ipairs( _player.GetAll() ) do
		if (v:HasInitialized() and v:GetPos():Distance(position) <= 768) then
			if ( openAura.player:CanSeePosition(v, position, 0.9, true) ) then
				umsg.Start("aura_Flashed", v);
				umsg.End();
			end;
		end;
	end;
end;

-- A function to spawn tear gas.
function openAura.schema:SpawnTearGas(position)
	local effectData = EffectData();
	local curTime = CurTime();
	
	effectData:SetStart(position);
	effectData:SetOrigin(position);
	effectData:SetScale(16);
	
	util.Effect("Explosion", effectData, true, true);
	
	local effectData = EffectData();
		effectData:SetOrigin(position);
		effectData:SetScale(2);
	util.Effect("aura_effect_smoke", effectData, true, true);
	
	for k, v in ipairs( ents.FindInSphere(position, 512) ) do
		if ( v:IsPlayer() and v:HasInitialized() ) then
			if ( openAura.player:CanSeePosition(v, position, 0.9, true) ) then
				local clothes = v:GetCharacterData("clothes");
				local itemTable = nil;
				
				if (clothes) then
					itemTable = openAura.item:Get(clothes);
				end;
				
				if (!itemTable or !itemTable.tearGasProtection) then
					if (!v.nextTearGas or curTime >= v.nextTearGas) then
						v.nextTearGas = curTime + 30;
						
						umsg.Start("aura_TearGas", v);
						umsg.End();
					end;
				end;
			end;
		end;
	end;
end;

-- A function to make a player wear clothes.
function openAura.schema:PlayerWearClothes(player, itemTable)
	local clothes = player:GetCharacterData("clothes");
	local team = player:Team();
	
	if (itemTable) then
		itemTable:OnChangeClothes(player, true);
		
		player:SetCharacterData("clothes", itemTable.index);
		player:SetSharedVar("clothes", itemTable.index);
	else
		itemTable = openAura.item:Get(clothes);
		
		if (itemTable) then
			itemTable:OnChangeClothes(player, false);
			
			player:SetCharacterData("clothes", nil);
			player:SetSharedVar("clothes", 0);
		end;
	end;
	
	if (itemTable) then
		player:UpdateInventory(itemTable.uniqueID);
	end;
end;

-- A function to get a player's heal amount.
function openAura.schema:GetHealAmount(player, scale)
	return ( 15 + openAura.attributes:Fraction(player, ATB_DEXTERITY, 35) ) * (scale or 1);
end;

-- A function to get a player's dexterity time.
function openAura.schema:GetDexterityTime(player)
	return 12 - openAura.attributes:Fraction(player, ATB_DEXTERITY, 5, 5);
end;

-- A function to bust down a door.
function openAura.schema:BustDownDoor(player, door, force)
	door.bustedDown = true;
	door:SetNotSolid(true);
	door:DrawShadow(false);
	door:SetNoDraw(true);
	door:EmitSound("physics/wood/wood_box_impact_hard3.wav");
	door:Fire("Unlock", "", 0);
	
	local fakeDoor = ents.Create("prop_physics");
	
	fakeDoor:SetCollisionGroup(COLLISION_GROUP_WORLD);
	fakeDoor:SetAngles( door:GetAngles() );
	fakeDoor:SetModel( door:GetModel() );
	fakeDoor:SetSkin( door:GetSkin() );
	fakeDoor:SetPos( door:GetPos() );
	fakeDoor:Spawn();
	
	local physicsObject = fakeDoor:GetPhysicsObject();
	
	if ( IsValid(physicsObject) ) then
		if (!force) then
			if ( IsValid(player) ) then
				physicsObject:ApplyForceCenter( ( door:GetPos() - player:GetPos() ):Normalize() * 10000 );
			end;
		else
			physicsObject:ApplyForceCenter(force);
		end;
	end;
	
	openAura.entity:Decay(fakeDoor, 300);
	
	openAura:CreateTimer("reset_door_"..door:EntIndex(), 300, 1, function()
		if ( IsValid(door) ) then
			door:SetNotSolid(false);
			door:DrawShadow(true);
			door:SetNoDraw(false);
			door.bustedDown = nil;
		end;
	end);
end;

-- A function to load the belongings.
function openAura.schema:LoadBelongings()
	local belongings = openAura:RestoreSchemaData( "plugins/belongings/"..game.GetMap() );
	
	for k, v in pairs(belongings) do
		local entity = ents.Create("aura_belongings");
		
		if ( v.inventory["human_meat"] ) then
			v.inventory["human_meat"] = nil;
		end;
		
		entity:SetAngles(v.angles);
		entity:SetData(v.inventory, v.cash);
		entity:SetPos(v.position);
		entity:Spawn();
		
		if (!v.moveable) then
			local physicsObject = entity:GetPhysicsObject();
			
			if ( IsValid(physicsObject) ) then
				physicsObject:EnableMotion(false);
			end;
		end;
	end;
end;

-- A function to save the belongings.
function openAura.schema:SaveBelongings()
	local belongings = {};
	
	for k, v in pairs( ents.FindByClass("prop_ragdoll") ) do
		if (v.areBelongings) then
			if (v.cash > 0 or table.Count(v.inventory) > 0) then
				belongings[#belongings + 1] = {
					cash = v.cash,
					angles = Angle(0, 0, -90),
					moveable = true,
					position = v:GetPos() + Vector(0, 0, 32),
					inventory = v.inventory
				};
			end;
		end;
	end;
	
	for k, v in pairs( ents.FindByClass("aura_belongings") ) do
		if ( v.cash and v.inventory and (v.cash > 0 or table.Count(v.inventory) > 0) ) then
			local physicsObject = v:GetPhysicsObject();
			local moveable;
			
			if ( IsValid(physicsObject) ) then
				moveable = physicsObject:IsMoveable();
			end;
			
			belongings[#belongings + 1] = {
				cash = v.cash,
				angles = v:GetAngles(),
				moveable = moveable,
				position = v:GetPos(),
				inventory = v.inventory
			};
		end;
	end;
	
	openAura:SaveSchemaData("plugins/belongings/"..game.GetMap(), belongings);
end;

-- A function to make a player drop random items.
function openAura.schema:PlayerDropRandomItems(player, ragdoll, evenClothes)
	local inventory = openAura.player:GetInventory(player);
	local clothes = player:GetCharacterData("clothes");
	local cash = openAura.player:GetCash(player);
	local info = {
		inventory = {},
		cash = cash
	};
	
	if ( !IsValid(ragdoll) ) then
		info.entity = ents.Create("aura_belongings");
	end;
	
	for k, v in pairs(inventory) do
		local itemTable = openAura.item:Get(k);
		
		if (itemTable and !itemTable.isRareItem) then
			if (itemTable.allowStorage != false) then
				if (clothes == itemTable.index) then
					if (!evenClothes) then
						v = v - 1;
					end;
				end;
				
				if (v > 0) then
					local success, fault = player:UpdateInventory(k, -v, true, true);
					
					if (success) then
						info.inventory[k] = v;
					end;
				end;
			end;
		end;
	end;
	
	player:SetCharacterData("cash", 0, true);
	
	if ( !IsValid(ragdoll) ) then
		if (table.Count(info.inventory) > 0 or info.cash > 0) then
			info.entity:SetAngles( Angle(0, 0, -90) );
			info.entity:SetData(info.inventory, info.cash);
			info.entity:SetPos( player:GetPos() + Vector(0, 0, 48) );
			info.entity:Spawn();
		else
			info.entity:Remove();
		end;
	else
		ragdoll.areBelongings = true;
		ragdoll.inventory = info.inventory;
		ragdoll.cash = info.cash;
	end;
	
	player:SaveCharacter();
end;

-- A function to tie or untie a player.
function openAura.schema:TiePlayer(player, isTied, reset, government)
	player:SetSharedVar("tied", isTied == true);
	
	if (isTied) then
		openAura.player:DropWeapons(player);
		openAura:PrintLog(LOGTYPE_GENERIC, player:Name().." has been tied.");
		
		player:Flashlight(false);
		player:StripWeapons();
	elseif (!reset) then
		if ( player:Alive() and !player:IsRagdolled() ) then 
			openAura.player:LightSpawn(player, true, true);
		end;
		
		openAura:PrintLog(LOGTYPE_GENERIC, player:Name().." has been untied.");
	end;
end;