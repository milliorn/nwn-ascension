//NWNX_ON_DM_GIVE_XP_AFTER
#include "nwnx_events"
#include "nwnx_object"
#include "inc_discord"
#include "nwnx_util"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    int iXP = StringToInt(NWNX_Events_GetEventData("AMOUNT"));
    object oPC =  NWNX_Object_StringToObject(NWNX_Events_GetEventData("OBJECT"));

    if (sCurrentEvent == "NWNX_ON_DM_GIVE_XP_AFTER")
    {
        string sMsg = "NAME: " + GetName(OBJECT_SELF) + " - " +
        "ACCOUNT: " + GetPCPlayerName(OBJECT_SELF) + " - " +
        "CD: " + GetPCPublicCDKey(OBJECT_SELF) + " - " +
        "IP: " + GetPCIPAddress(OBJECT_SELF) + " - " +

        " gave (" + IntToString(iXP) + ") XP to - " +

        "NAME: " + GetName(oPC) + " - " +
        "ACCOUNT: " + GetPCPlayerName(oPC) + " - " +
        "CD: " + GetPCPublicCDKey(oPC) + " - " +
        "IP: " + GetPCIPAddress(oPC);

        ModMiscWebhook(sMsg);
    }
}
