openAuth = {}

if(!openAura)then
	openAura = GM;

	AddCSLuaFile("cl_init.lua");
	DeriveGamemode("openaura");
end;

function openAuth.EnableTick()
	openAura.ShouldTick = true;
end;

function openAuth.Initialize()
	openAura.config:Import("gamemodes/openaura/mysql.cfg")
	openAura.config:Import("gamemodes/openaura/owner.cfg")
 	openAura.plugin:Call("OpenAuraCoreLoaded")

	local useLocalMachineDate = openAura.config:Get('use_local_machine_date'):Get();
	local useLocalMachineTime = openAura.config:Get('use_local_machine_time'):Get();
	local defaultDate = openAura.option:GetKey('default_date');
	local defaultTime = openAura.option:GetKey('default_time');
	local defaultDays = openAura.option:GetKey('default_days');
	local username = openAura.config:Get('mysql_username'):Get();
	local password = openAura.config:Get('mysql_password'):Get();
	local database = openAura.config:Get('mysql_database'):Get();
	local dateInfo = os.date('*t');
	local host = openAura.config:Get('mysql_host'):Get();
	local success, value = pcall(tmysql.initialize, host, username, password, database, 3306, 6, 6);
	openAura.NoMySQL = !success;
	
	if (useLocalMachineTime) then
		openAura.config:Get('minute_time'):Set(60);
	end;
	
	openAura.config:SetInitialized(true);
	table.Merge(openAura.time, defaultTime);
	table.Merge(openAura.date, defaultDate);
	math.randomseed( os.time() );
	
	if (useLocalMachineTime) then
		local realDay = dateInfo.wday - 1;
		if (realDay == 0) then
			realDay = #defaultDays;
		end;
		table.Merge( openAura.time, {
			minute = dateInfo.min,
			hour = dateInfo.hour,
			day = realDay
		} );
		openAura.NextDateTimeThink = SysTime() + (60 - dateInfo.sec);
	else
		table.Merge( openAura.time, openAura:RestoreSchemaData('time') );
	end;
	
	if (useLocalMachineDate) then
		dateInfo.year = dateInfo.year + (defaultDate.year - dateInfo.year);
		table.Merge( openAura.time, {
			month = dateInfo.month,
			year = dateInfo.year,
			day = dateInfo.yday
		} );
 	else
		table.Merge( openAura.date, openAura:RestoreSchemaData('date') );
	end;
	
	AURA_CONVAR_LOG = openAura:CreateConVar('aura_log', 1);
	
	for k, v in pairs(openAura.config.stored) do
		openAura.plugin:Call('OpenAuraConfigInitialized', k, v.value);
	end;
	
	RunConsoleCommand('sv_usermessage_maxsize', '1024');
	openAura.plugin:Call('OpenAuthInitialized', true);
	openAura.plugin:Call('OpenAuraInitialized');
	openAura:LoadBans();
end;