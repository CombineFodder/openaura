--[[
Name: "sh_auto.lua".
Product: "Cider Two".
--]]

openAura.schema.billboards = {
	{
		position = Vector(-7847.8687, -7728.4404, 930.2415),
		angles = Angle(0, 90, 90),
		scale = 0.4375
	},
	{
		position = Vector(-5579.8511 -7212.6436, 816.4194),
		angles = Angle(0, -90, 90),
		scale = 0.4375
	},
	{
		position = Vector(-7719.0088, -4902.2466, 929.4857),
		angles = Angle(0, 90, 90),
		scale = 0.4375
	},
	{
		position = Vector(-5615.9512, -10324.8281, 926.2682),
		angles = Angle(0, -90, 90),
		scale = 0.4375
	},
	{
		position = Vector(-5579.8511, -7214.5537, 815.8289),
		angles = Angle(0, -90, 90),
		scale = 0.4375
	},
	{
		position = Vector(-446.1304, 6122.8198, 342.4596),
		angles = Angle(0, 50, 90),
		scale = 0.4375
	},
	{
		position = Vector(3489.8989, -6673.7188, 499.5970),
		angles = Angle(0, -180, 90),
		scale = 0.4375
	},
	{
		position = Vector(427.7188, 4524.6401, 440.7368),
		angles = Angle(0, -90, 90),
		scale = 0.4375
	},
	{
		position = Vector(790.3043, 7232.0161, 571.6388),
		angles = Angle(0, 90, 90),
		scale = 0.4375
	},
	{
		position = Vector(4208.2612, 5631.6914, 723.6007),
		angles = Angle(0, 90, 90),
		scale = 0.4375
	},
	{
		position = Vector(1861.0153, 3574.7188, 523.0126),
		angles = Angle(0, 0, 90),
		scale = 0.4375
	}
};

for k, v in pairs( _file.Find("models/humans/group17/*.mdl", true) ) do
	openAura.animation:AddMaleHumanModel("models/humans/group17/"..v);
end;

for k, v in pairs( _file.Find("models/humans/group99/*.mdl", true) ) do
	if ( string.find(string.lower(v), "female") ) then
		openAura.animation:AddFemaleHumanModel("models/humans/group99/"..v);
	else
		openAura.animation:AddMaleHumanModel("models/humans/group99/"..v);
	end;
end;

for k, v in pairs( _file.Find("models/humans/group09/*.mdl", true) ) do
	if ( string.find(string.lower(v), "female") ) then
		openAura.animation:AddFemaleHumanModel("models/humans/group09/"..v);
	else
		openAura.animation:AddMaleHumanModel("models/humans/group09/"..v);
	end;
end;

for k, v in pairs( _file.Find("models/humans/group10/*.mdl", true) ) do
	if ( string.find(string.lower(v), "female") ) then
		openAura.animation:AddFemaleHumanModel("models/humans/group10/"..v);
	else
		openAura.animation:AddMaleHumanModel("models/humans/group10/"..v);
	end;
end;

for k, v in pairs( _file.Find("models/humans/group08/*.mdl", true) ) do
	if ( string.find(string.lower(v), "female") ) then
		openAura.animation:AddFemaleHumanModel("models/humans/group08/"..v);
	else
		openAura.animation:AddMaleHumanModel("models/humans/group08/"..v);
	end;
end;

for k, v in pairs( _file.Find("models/humans/group07/*.mdl", true) ) do
	if ( string.find(string.lower(v), "female") ) then
		openAura.animation:AddFemaleHumanModel("models/humans/group07/"..v);
	else
		openAura.animation:AddMaleHumanModel("models/humans/group07/"..v);
	end;
end;

for k, v in pairs( _file.Find("models/humans/group04/*.mdl", true) ) do
	if ( string.find(string.lower(v), "female") ) then
		openAura.animation:AddFemaleHumanModel("models/humans/group04/"..v);
	else
		openAura.animation:AddMaleHumanModel("models/humans/group04/"..v);
	end;
end;

openAura.option:SetKey("model_shipment", "models/props_junk/cardboard_box003b.mdl");
openAura.option:SetKey("intro_image", "cidertwo/cidertwo2");
openAura.option:SetKey("menu_music", "music/hl2_song20_submix0.mp3");
openAura.option:SetKey("gradient", "cidertwo/gradient2");

openAura.option:SetColor( "information", Color(200, 100, 100, 255) );

openAura.config:ShareKey("intro_text_small");
openAura.config:ShareKey("intro_text_big");

openAura.option:SetFont("bar_text", "cid_TargetIDText");
openAura.option:SetFont("main_text", "cid_MainText");
openAura.option:SetFont("hints_text", "cid_IntroTextTiny");
openAura.option:SetFont("large_3d_2d", "cid_Large3D2D");
openAura.option:SetFont("target_id_text", "cid_TargetIDText");
openAura.option:SetFont("cinematic_text", "cid_CinematicText");
openAura.option:SetFont("date_time_text", "cid_IntroTextSmall");
openAura.option:SetFont("menu_text_big", "cid_MenuTextBig");
openAura.option:SetFont("menu_text_huge", "cid_MenuTextHuge");
openAura.option:SetFont("menu_text_tiny", "cid_IntroTextTiny");
openAura.option:SetFont("intro_text_big", "cid_IntroTextBig");
openAura.option:SetFont("menu_text_small", "cid_IntroTextSmall");
openAura.option:SetFont("intro_text_tiny", "cid_IntroTextTiny");
openAura.option:SetFont("intro_text_small", "cid_IntroTextSmall");
openAura.option:SetFont("player_info_text", "cid_PlayerInfoText");

openAura:RegisterGlobalSharedVar("noWagesTime", NWTYPE_NUMBER);
openAura:RegisterGlobalSharedVar("lottery", NWTYPE_NUMBER);
openAura:RegisterGlobalSharedVar("agenda", NWTYPE_STRING);

openAura.player:RegisterSharedVar("beingChloro", NWTYPE_BOOL, true);
openAura.player:RegisterSharedVar("skullMask", NWTYPE_BOOL);
openAura.player:RegisterSharedVar("beingTied", NWTYPE_BOOL, true);
openAura.player:RegisterSharedVar("alliance", NWTYPE_STRING);
openAura.player:RegisterSharedVar("disguise", NWTYPE_ENTITY);
openAura.player:RegisterSharedVar("clothes", NWTYPE_NUMBER, true);
openAura.player:RegisterSharedVar("lottery", NWTYPE_BOOL, true);
openAura.player:RegisterSharedVar("sensor", NWTYPE_BOOL, true);
openAura.player:RegisterSharedVar("hunger", NWTYPE_NUMBER, true);
openAura.player:RegisterSharedVar("thirst", NWTYPE_NUMBER, true);
openAura.player:RegisterSharedVar("leader", NWTYPE_BOOL);
openAura.player:RegisterSharedVar("tied", NWTYPE_NUMBER);

openAura.quiz:SetName("Agreement");
openAura.quiz:SetEnabled(true);
openAura.quiz:AddQuestion("I know that because of the logs, I will never get away with rule-breaking.", 1, "Yes.", "No.");
openAura.quiz:AddQuestion("When creating a character, I will use a full and appropriate name.", 1, "Yes.", "No.");
openAura.quiz:AddQuestion("I understand that the script has vast logs that are checked often.", 1, "Yes.", "No.");
openAura.quiz:AddQuestion("I will read the guidelines and directory in the main menu.", 1, "Yes.", "No.");

openAura:IncludePrefixed("sh_coms.lua");
openAura:IncludePrefixed("sv_hooks.lua");
openAura:IncludePrefixed("cl_hooks.lua");

openAura.flag:Add("q", "Special", "Access to the special items.");