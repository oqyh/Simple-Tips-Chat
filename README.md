# [ANY] Simple Tips Chat (1.0.4)
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable Tips Messages || 1= Yes || 0= No
sm_tips_enable "1"
// Enable Prefix Tips Tag || 1= Yes || 0= No
sm_prefix_enable "1"

// How many Tips Messages Did You Use In Simple_Tips_Chat.phrases
sm_tips_lines "7"
// Do You Want Spaces Between Tips And Chat  || 1= Yes || 0= No
sm_tips_spaces "1"
// Save Enable/Disable Client Cookie || 1= Yes || 0= No (Next Map Or Reconnect Client Tips Will Be By Default Enabled)
sm_tips_cookie "1"
// Time In Seconds Between Tips Messages
sm_tips_time "101.0"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable Welcome Message || 1= Yes || 0= No
sm_tips_enable_welcome "1"

// How Many Welcome Messages Did You Use In Simple_Tips_Chat.phrases Max is 8 Lines
sm_tips_welcome_lines "7"
// Time In Seconds To Send Welcome Messages
sm_tips_welcome_time "15.0"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable Command Discord Print Chat || 1= Yes || 0= No
sm_tips_enable_discord "1"

// Enable Command Ip Print Chat || 1= Yes || 0= No
sm_tips_enable_ip "1"

// Enable Command Steamgroup Print Chat || 1= Yes || 0= No
sm_tips_enable_steamgroup "1"

// Enable Command Website Print Chat || 1= Yes || 0= No
sm_tips_enable_website "1"
```


## .:[ Change Log ]:.
```
(1.0.4)
- Added Cvar sm_prefix_enable "1" Enable Prefix Tips Tag
- Added Cvar sm_tips_spaces "1" Spaces Between Tips And Chat

(1.0.3)
- Added Cvar sm_tips_cookie "1" Save Enable Disable Client Cookie || 1= Yes || 0= No (Next Map Or Reconnect Client Tips Will Be By Default Enable)

(1.0.2)
- Fix toggle problem

(1.0.1)
- Fix Client x is not in game

(1.0.0)
- Initial Release
```


## .:[ Donation ]:.

If this project help you reduce time to develop, you can give me a cup of coffee :)

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/oQYh)
