#include <sourcemod>
#include <multicolors>
#pragma semicolon 1

#define MAX_C_L 128

static ArrayList gCommands;

ConVar g_etips;
ConVar g_cmdtips;
ConVar g_cmddis;
ConVar g_cmdip;
ConVar g_cmdweb;
ConVar g_cmdsteam;
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
char sPhrase[64];

public Plugin myinfo = 
{
	name = "Simple Tips Chat",
	author = "Gold_KingZ",
	description = "Print In Chat Tips, Ip, Steamgroup,  Discord",
	version = "1.0.1",
	url = "https://github.com/oqyh"
}

public OnPluginStart()
{
	LoadTranslations( "Simple_Tips_Chat.phrases" );
	
	g_etips =	CreateConVar( "sm_tips_enable",	"1",	"Enable Tips Messages || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_tlines	=	CreateConVar( "sm_tips_lines",	"6",	"How many Tips Messages did you use in Simple_Tips_Chat.phrases");
	g_timetip	=	CreateConVar( "sm_tips_time",	"101.0",	"Time in seconds between Tips Messages");
	
	g_Cvar_WpEnabled =	CreateConVar("sm_tips_enable_welcome", "1", "Enable Welcome Message || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_wlines	=	CreateConVar( "sm_tips_welcome_lines",	"7",	"How many Welcome Messages did you use in Simple_Tips_Chat.phrases Max is 8 Lines", _, true, 0.0, true, 8.0);
	g_timewelcome	=	CreateConVar( "sm_tips_welcome_time",	"15.0",	"Time in seconds To Send Welcome messages");

	g_eipprint	=	CreateConVar( "sm_tips_enable_ip",	"1",	"Enable Command ip print chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_ediscord	=	CreateConVar( "sm_tips_enable_discord",	"1",	"Enable Command discord print chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_egroup	=	CreateConVar( "sm_tips_enable_steamgroup",	"1",	"Enable Command steamgroup print chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	g_ewebsite	=	CreateConVar( "sm_tips_enable_website",	"1",	"Enable Command website print chat || 1= Yes || 0= No", _, true, 0.0, true, 1.0);
	
	g_cmdtips =	CreateConVar( "sm_tips_cmd_tips",	"sm_tips;sm_tip",	"Commands To Disable / Enable Tips");
	g_cmdip =	CreateConVar( "sm_tips_cmd_ip",	"sm_ip;sm_serverip",	"Commands To Print Ip");
	g_cmddis =	CreateConVar( "sm_tips_cmd_dis",	"sm_discord",	"Commands To Print Discord");
	g_cmdsteam =	CreateConVar( "sm_tips_cmd_steam",	"sm_steamgroup;sm_steam;sm_group",	"Commands To Print Steam Group");
	g_cmdweb =	CreateConVar( "sm_tips_cmd_web",	"sm_website;sm_web;sm_site",	"Commands To Print Website");
	
	AutoExecConfig(true, "Simple_Tips_Chat");
	
	CreateTimer(1.0, Timer_Tip);
}

public void OnConfigsExecuted()
{
	char zbuffs1[1024];
	char zbuffs2[1024];
	char zbuffs3[1024];
	char zbuffs4[1024];
	char zbuffs5[1024];
	g_cmdtips.GetString(zbuffs1, sizeof(zbuffs1));
	g_cmdip.GetString(zbuffs2, sizeof(zbuffs2));
	g_cmddis.GetString(zbuffs3, sizeof(zbuffs3));
	g_cmdsteam.GetString(zbuffs4, sizeof(zbuffs4));
	g_cmdweb.GetString(zbuffs5, sizeof(zbuffs5));
	RegCCmdz(zbuffs1, Command_Tips, "Commands To Disable / Enable Tips");
	RegCCmdz(zbuffs2, Ip_Print, "Commands To Print Ip");
	RegCCmdz(zbuffs3, Discord, "Commands To Print Discord");
	RegCCmdz(zbuffs4, steamgroup, "Commands To Print Steam Group");
	RegCCmdz(zbuffs5, Website, "Commands To Print Website");
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
	DisableTips[client] = false;
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

public Action Timer_Tip(Handle event, Handle timer)
{
	if (GetConVarBool(g_etips))
	{
		for(new i=1; i<=MaxClients; i++)
		{
		if(!IsValidEntity(i)) continue;
		if(!IsClientInGame(i)) continue;
		if(DisableTips[i]) continue;

		FormatEx(sPhrase, sizeof(sPhrase), "Tip%i", GetRandomInt(2, GetConVarInt(g_tlines))-1);
		CPrintToChat(i, " %t %T", "Chat_Prefix", sPhrase, i);
		}
	}
	CreateTimer(GetConVarFloat(g_timetip), Timer_Tip);
	return Plugin_Continue;
}

public Action Command_Tips(client, args)
{
	if (GetConVarBool(g_etips))
	{
		DisableTips[client] = !DisableTips[client];
		if(DisableTips[client] == true)
		{
			CPrintToChat(client, " %t %t", "Chat_Prefix", "Disable");
		}else
		if(DisableTips[client] == false)
		{
			CPrintToChat(client, " %t %t", "Chat_Prefix", "Enable");
		}
	}
	return Plugin_Continue;
}

stock void RegCCmdz(const char[] commands, ConCmd callback, const char[] description = "", int flags = 0)
{
	if(!gCommands)
		gCommands = new ArrayList(ByteCountToCells(MAX_C_L));
	
	ArrayList arr = new ArrayList(ByteCountToCells(MAX_C_L));
	
	char buff[MAX_C_L];
	int start_pos, len;
	bool shouldskip;
	for(int i = 0; commands[i] != '\0'; start_pos = i++)
	{
		buff[0] = '\0';
		
		do
		{
			if((!IsCharAlpha(commands[i]) && !IsCharNumeric(commands[i]) && commands[i] != '_') || i - start_pos + 1 >= MAX_C_L)
			{
				len = FindCharInString(commands[i], ';');
				if(len == -1)
					i = start_pos + strlen(commands[start_pos]);
				else
					i += len;
				
				len = i++ - start_pos + 1;
				char[] tempbuff = new char[len + 1];
				strcopy(tempbuff, len, commands[start_pos]);
				LogError("Failed To Find command \"%s\".", tempbuff);
				
				shouldskip = true;
				break;
			}
		}
		while(commands[++i] != ';' && commands[i] != '\0');
		
		if(shouldskip)
			continue;
		
		len = i++ - start_pos + 1;
		strcopy(buff, (len > MAX_C_L ? MAX_C_L : len), commands[start_pos]);
		
		if(gCommands.FindString(buff) == -1)
			RegConsoleCmd(buff, callback, description, flags);
		
		arr.PushString(buff);
	}
	
	delete gCommands;
	gCommands = arr.Clone();
	
	delete arr;
}