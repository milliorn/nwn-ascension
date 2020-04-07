//::///////////////////////////////////////////////
//:: x3_mod_def_enter
//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 22, 2020
//::
//:://////////////////////////////////////////////
// Modified 12-22-2003 by AW Olorin to Automatically make DM's
// Anonymous to PcScry on module entry.
// Modified 1-25-2004 by AW Olorin - Remove message stones
// Modified 6-11-2004 by AW Olorin - Added Mod news message
// DM's log on anonymously. -- AW Olorin

#include "inc_event_module"

void main()
{
    object oPC = GetEnteringObject();

    string sName = GetName(oPC);
    string sAccount = GetPCPlayerName(oPC);
    string sCDKey = GetPCPublicCDKey(oPC);
    string sIP = GetPCIPAddress(oPC);
    string sBIC = NWNX_Player_GetBicFileName(oPC);

    //  Send a message to Discord Channel of the client logging in.
    LoginWebhook(oPC);

    //  Validate DM Entry
    if (VerifyDM(oPC)) return;

    //  Redundant DM check to break the script if its a DM.
    if (GetIsDM(oPC)) return;

    //  Write a server log of the entering PC
    WriteTimestampedLogEntry("Player: " + sName
    + " Account: " + sAccount
    + " KEY: " + sCDKey
    + " IP: " + sIP
    + " BIC: " + sBIC);

    //  New player strip down
    if (!GetIsObjectValid(GetItemPossessedBy(oPC, "itm_teleport")))
    {
        StripPC(oPC);
    }

    //  Notify Server on Shout of a Login.
    SpeakString(StringToRGBString("LOGIN: "
    + "\nPlayer: ", "777") + sName
    + StringToRGBString("\nAccount: ", "777") + sAccount
    + StringToRGBString("\nKey: ", "777") + sCDKey, TALKVOLUME_SHOUT);

    //  Load PC HP's
    HitPointsAntiCheatOnEnter(oPC);

    //  Remove all buffs
    RemoveAllEffects(oPC);

    //  Automated visual upon PC entering the module casted on the starting location.
    DelayCommand(6.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetStartingLocation()));

    //  Chat Cooldown Var
    DelayCommand(0.9, DeleteLocalInt(oPC, "PC_CHAT"));


    //  Advertise the server
    DelayCommand(6.0, SendMessageToPC(oPC, StringToRGBString("This world was built by AW Trespasser.\nWork began on it when NWN was first released.\nIt has been a long arduous process, but here is the final result.", "777")));
    DelayCommand(12.0, FloatingTextStringOnCreature(StringToRGBString("Join us on our Discord Channel!", "777"), oPC, FALSE));
    DelayCommand(14.0, FloatingTextStringOnCreature(StringToRGBString("https://discord.gg/VjDUCSx", "777"), oPC, FALSE));
    DelayCommand(16.0, FloatingTextStringOnCreature(StringToRGBString("Press 'J' to read your journal for important info!", "777"), oPC, FALSE));
}
