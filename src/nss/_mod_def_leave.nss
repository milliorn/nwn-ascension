//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 25, 2020
//::
//:://////////////////////////////////////////////
#include "inc_event_module"

void main()
{
    object oPC = GetExitingObject();

    string sName = GetName(oPC);
    string sAccount = GetPCPlayerName(oPC);
    string sCDKey = GetPCPublicCDKey(oPC);
    string sIP = GetPCIPAddress(oPC);
    string sBIC = NWNX_Player_GetBicFileName(oPC);

    //  Write a server log of the entering PC
    WriteTimestampedLogEntry("Player: " + sName
    + " Account: " + sAccount
    + " KEY: " + sCDKey
    + " IP: " + sIP
    + " BIC: " + sBIC);

    //  Send a message to Discord Channel of the client logging out
    LogoutWebhook(oPC);

    //  If we are a DM we break the script
    if (GetIsDM(oPC))
        return;

    //  Notify Server on Shout of a Login.
    SpeakString(StringToRGBString("LOGOUT: " + "\nPlayer: ", "777") + sName
    + StringToRGBString("\nAccount: ", "777") + sAccount
    + StringToRGBString("\nKey: ", "777") + sCDKey, TALKVOLUME_SHOUT);

    //  Apply penalty if we logout in combat
    DeathLog(oPC);

    //  Store player HP's
    HitPointsAntiCheatOnExit(oPC);

    //  Logout Penalty if you are dead or dying
    if (GetCurrentHitPoints(oPC) <= 0)
        DrowCorpseLoot(oPC);

    //  Database save
    SaveRedis();
}
