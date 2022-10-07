#include <sourcemod>
#include <clientprefs>
#include <multicolors>

#pragma semicolon 1

ConVar g_etips;
ConVar g_eprefix;
ConVar g_ecookie;
ConVar g_tspace;
ConVar g_eipprint;
ConVar g_ediscord;
ConVar g_egroup;
ConVar g_timetip;
ConVar g_timewelcome;
ConVar g_ewebsite;

bool DisableTips[MAXPLAYERS+1];
Handle g_Cvar_WpEnabled = INVALID_HANDLE;
Handle g_tlines = INVALID_HANDLE;
Handle g_wlines = INVALID_HANDLE;
Handle g_TipsCookie;
char sPhrase[64];

public Plugin myinfo = 
{
	name = "Simple Tips Chat",
	author = "Gold_KingZ",
	description = "Print In Chat Tips, Ip, Steamgroup,  Discord",
	version = "1.0.4",
	url = "https://github.com/oqyh"
}

public OnPluginStart()
{
	LoadTranslations( "Simple_Tips_Chat.phrases" );
	
	g_etips =	CreateConVar( "sm_tips_enable",	"1",	"Enable Tips Messages || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_eprefix =	CreateConVar( "sm_prefix_enable",	"1",	"Enable Prefix Tips Tag || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_ecookie =	CreateConVar( "sm_tips_cookie",	"1",	"Save Enable/Disable Client Cookie || 1= Yes || 0= No (Next Map Or Reconnect Client Tips Will Be By Default Enabled)", _, true, 0.0, true, 1.0);
	g_tlines	=	CreateConVar( "sm_tips_lines",	"6",	"How many Tips Messages Did You Use In Simple_Tips_Chat.phrases");
	g_tspace	=	CreateConVar( "sm_tips_spaces",	"1",	"Do You Want Spaces Between Tips And Chat  || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_timetip	=	CreateConVar( "sm_tips_time",	"101.0",	"Time In Seconds Between Tips Messages");
	
	g_Cvar_WpEnabled =	CreateConVar("sm_tips_enable_welcome", "1", "Enable Welcome Message || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_wlines	=	CreateConVar( "sm_tips_welcome_lines",	"7",	"How Many Welcome Messages Did You Use In Simple_Tips_Chat.phrases Max is 8 Lines", _, true, 0.0, true, 8.0);
	g_timewelcome	=	CreateConVar( "sm_tips_welcome_time",	"15.0",	"Time In Seconds To Send Welcome Messages");

	g_eipprint	=	CreateConVar( "sm_tips_enable_ip",	"1",	"Enable Command Ip Print Chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_ediscord	=	CreateConVar( "sm_tips_enable_discord",	"1",	"Enable Command Discord Print Chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_egroup	=	CreateConVar( "sm_tips_enable_steamgroup",	"1",	"Enable Command Steamgroup Print Chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_ewebsite	=	CreateConVar( "sm_tips_enable_website",	"1",	"Enable Command Website Print Chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	
	RegConsoleCmd("sm_tips", Command_Tips);
	RegConsoleCmd("sm_tip", Command_Tips);
	RegConsoleCmd("sm_hints", Command_Tips);
	
	RegConsoleCmd("sm_serverip", Ip_Print);
	RegConsoleCmd("sm_ip", Ip_Print);
	
	RegConsoleCmd("sm_discord", Discord);
	
	RegConsoleCmd("sm_steamgroup", steamgroup);
	RegConsoleCmd("sm_steam", steamgroup);
	RegConsoleCmd("sm_group", steamgroup);
	
	RegConsoleCmd("sm_website", Website);
	RegConsoleCmd("sm_web", Website);
	RegConsoleCmd("sm_site", Website);
	
	g_TipsCookie = RegClientCookie("Simple_Tips_Chat_Enable", "Simple Tips Chat Enable", CookieAccess_Protected);
	
	AutoExecConfig(true, "Simple_Tips_Chat");
	
	CreateTimer(1.0, Timer_Tip);
}

public void OnClientCookiesCached(int client)
{
		char sCookie[8];
		GetClientCookie(client,g_TipsCookie, sCookie, sizeof(sCookie));
		DisableTips[client] = view_as<bool>(StringToInt(sCookie));
}

public Action T_Wel(Handle timer, any client)
{
	WelcomeJoinAnnouncer(client);
	return Plugin_Handled;
}

public Action WelcomeJoinAnnouncer(client)
{
	if (IsClientConnected(client) && IsClientInGame(client))
	{
	switch(GetConVarInt(g_wlines))
	{
		case 0:
		{
			return Plugin_Continue;
		}
		case 1:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
		}
		case 2:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
			CPrintToChat(client, "%t", "Welcome2", client);
		}
		case 3:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
			CPrintToChat(client, "%t", "Welcome2", client);
			CPrintToChat(client, "%t", "Welcome3", client);
		}
		case 4:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
			CPrintToChat(client, "%t", "Welcome2", client);
			CPrintToChat(client, "%t", "Welcome3", client);
			CPrintToChat(client, "%t", "Welcome4", client);
		}
		case 5:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
			CPrintToChat(client, "%t", "Welcome2", client);
			CPrintToChat(client, "%t", "Welcome3", client);
			CPrintToChat(client, "%t", "Welcome4", client);
			CPrintToChat(client, "%t", "Welcome5", client);
		}
		case 6:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
			CPrintToChat(client, "%t", "Welcome2", client);
			CPrintToChat(client, "%t", "Welcome3", client);
			CPrintToChat(client, "%t", "Welcome4", client);
			CPrintToChat(client, "%t", "Welcome5", client);
			CPrintToChat(client, "%t", "Welcome6", client);
		}
		case 7:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
			CPrintToChat(client, "%t", "Welcome2", client);
			CPrintToChat(client, "%t", "Welcome3", client);
			CPrintToChat(client, "%t", "Welcome4", client);
			CPrintToChat(client, "%t", "Welcome5", client);
			CPrintToChat(client, "%t", "Welcome6", client);
			CPrintToChat(client, "%t", "Welcome7", client);
		}
		case 8:
		{
			CPrintToChat(client, "%t", "Welcome1", client);
			CPrintToChat(client, "%t", "Welcome2", client);
			CPrintToChat(client, "%t", "Welcome3", client);
			CPrintToChat(client, "%t", "Welcome4", client);
			CPrintToChat(client, "%t", "Welcome5", client);
			CPrintToChat(client, "%t", "Welcome6", client);
			CPrintToChat(client, "%t", "Welcome7", client);
			CPrintToChat(client, "%t", "Welcome8", client);
		}
	}
	}
	return Plugin_Continue;
}

public OnClientPutInServer(client)
{
	if (!GetConVarBool(g_ecookie))
	{
		DisableTips[client] = false;
	}
}

public OnClientPostAdminCheck(client)
{
	if (GetConVarBool(g_Cvar_WpEnabled))
	{
		CreateTimer (GetConVarFloat(g_timewelcome), T_Wel, client);
	}
}

public Action Website(int client,int args)
{
	if (!GetConVarBool(g_ewebsite)) return Plugin_Continue;
	
	CPrintToChat(client, " %t %t", "Chat_Prefix", "Website");
	
	return Plugin_Continue;
}

public Action Ip_Print(int client,int args)
{
	if (!GetConVarBool(g_eipprint)) return Plugin_Continue;
	
	CPrintToChat(client, " %t %t", "Chat_Prefix", "Ip_Server");
	
	return Plugin_Continue;
}

public Action Discord(int client,int args)
{
	if (!GetConVarBool(g_ediscord)) return Plugin_Continue;
	
	CPrintToChat(client, " %t %t", "Chat_Prefix", "Discord");
	
	return Plugin_Continue;
}

public Action steamgroup(int client,int args)
{
	if (!GetConVarBool(g_egroup)) return Plugin_Continue;
	
	CPrintToChat(client, " %t %t", "Chat_Prefix", "SteamGroup");
	
	return Plugin_Continue;
}

public Action Timer_Tip(Handle timer)
{
	if (GetConVarBool(g_etips))
	{
		if (GetConVarBool(g_eprefix))
		{
			for(new i=1; i<=MaxClients; i++)
			{
				if(!IsValidEntity(i)) continue;
				if(!IsClientInGame(i)) continue;
				if(DisableTips[i]) continue;
				
				if(GetConVarBool(g_tspace))
				{
					FormatEx(sPhrase, sizeof(sPhrase), "Tip%i", GetRandomInt(2, GetConVarInt(g_tlines))-1);
					CPrintToChat(i, "");
					CPrintToChat(i, " %t %T", "Chat_Prefix", sPhrase, i);
					CPrintToChat(i, "");
				}else if(!GetConVarBool(g_tspace))
				{
					FormatEx(sPhrase, sizeof(sPhrase), "Tip%i", GetRandomInt(2, GetConVarInt(g_tlines))-1);
					CPrintToChat(i, " %t %T", "Chat_Prefix", sPhrase, i);
				}
			}
		}else if (!GetConVarBool(g_eprefix))
		{
			for(new i=1; i<=MaxClients; i++)
			{
				if(!IsValidEntity(i)) continue;
				if(!IsClientInGame(i)) continue;
				if(DisableTips[i]) continue;
				
				if(GetConVarBool(g_tspace))
				{
					FormatEx(sPhrase, sizeof(sPhrase), "Tip%i", GetRandomInt(2, GetConVarInt(g_tlines))-1);
					CPrintToChat(i, "");
					CPrintToChat(i, " %T", sPhrase, i);
					CPrintToChat(i, "");
				}else if(!GetConVarBool(g_tspace))
				{
					FormatEx(sPhrase, sizeof(sPhrase), "Tip%i", GetRandomInt(2, GetConVarInt(g_tlines))-1);
					CPrintToChat(i, " %T", sPhrase, i);
				}
			}
		}
	}
	CreateTimer(GetConVarFloat(g_timetip), Timer_Tip);
	return Plugin_Continue;
}

public Action Command_Tips(int client, int args)
{
	if (GetConVarBool(g_etips))
	{
		DisableTips[client] = !DisableTips[client];
		
		char sCookie[8];
		IntToString(DisableTips[client], sCookie, sizeof(sCookie));
		SetClientCookie(client, g_TipsCookie, sCookie);
		
		if(DisableTips[client])
		{
			CPrintToChat(client, " %t %t", "Chat_Prefix", "Disable");
		}
		else
		{
			CPrintToChat(client, " %t %t", "Chat_Prefix", "Enable");
		}
		return Plugin_Handled;
	}
	return Plugin_Continue;
}