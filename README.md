# [ANY] Simple Tips Chat (1.0.1)
https://forums.alliedmods.net/showthread.php?p=2786726

### Print To Clients Tips Messages In Chat, Ip, Steamgroup,  Discord

![alt text](https://github.com/oqyh/Simple-Tips-Chat/blob/main/img/Screenshot%20(12424).png?raw=true)


## .:[ Install ]:.
```
1- Modify addons\sourcemod\translations\Simple_Tips_Chat.phrases.txt
=> Add Welcome1\Welcome2\Welcome3 <--- then take Welcome(3) Number 3 to Simple_Tips_Chat.cfg -> sm_tips_welcome_lines "3" <-- 3 Welcome Messages
=> Add Tip1\Tip2\Tip3\Tip4 <--- then take Tip(4) Number 4 to Simple_Tips_Chat.cfg -> sm_tips_lines "4" <-- 4 Tips Messages

2- Modify cfg\sourcemod\Simple_Tips_Chat.cfg 
=> Welcome messages <--- sm_tips_welcome_time "X" Time in seconds
=> Tips messages <--- sm_tips_time "X" Time in seconds
```


## .:[ ConVars ]:.
```
// Enable Tips Messages || 1= Yes || 0= No
sm_tips_enable "1"

// Commands To Disable / Enable Tips
sm_tips_cmd_tips "sm_tips;sm_tip"

// How many Tips Messages did you use in Simple_Tips_Chat.phrases
sm_tips_lines "6"

// Time in seconds between Tips Messages
// Default: "101.0"
sm_tips_time "101.0"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable Welcome Message || 1= Yes || 0= No
sm_tips_enable_welcome "1"

// How many Welcome Messages did you use in Simple_Tips_Chat.phrases Max is 8 Lines
sm_tips_welcome_lines "7"

// Time in seconds To Send Welcome messages
// Default: "15.0"
sm_tips_welcome_time "15.0"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable Command discord print chat || 1= Yes || 0= No
sm_tips_enable_discord "1"

// Commands To Print Discord
sm_tips_cmd_dis "sm_discord"



// Enable Command ip print chat || 1= Yes || 0= No
sm_tips_enable_ip "1"

// Commands To Print Ip
sm_tips_cmd_ip "sm_ip;sm_serverip"



// Enable Command steamgroup print chat || 1= Yes || 0= No
sm_tips_enable_steamgroup "1"

// Commands To Print Steam Group
sm_tips_cmd_steam "sm_steamgroup;sm_steam;sm_group"



// Enable Command website print chat || 1= Yes || 0= No
sm_tips_enable_website "1"

// Commands To Print Website
sm_tips_cmd_web "sm_website;sm_web;sm_site"
```


## .:[ Change Log ]:.
```
(1.0.1)
- Fix Client x is not in game

(1.0.0)
- Initial Release
```


## .:[ Donation ]:.

If this project help you reduce time to develop, you can give me a cup of coffee :)

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/oQYh)
