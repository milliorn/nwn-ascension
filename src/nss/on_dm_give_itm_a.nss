//NWNX_ON_DM_GIVE_ITEM_AFTER
#include "nwnx_events"
#include "nwnx_object"
#include "inc_discord"
#include "nwnx_util"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    object oTarget = NWNX_Object_StringToObject(NWNX_Events_GetEventData("TARGET"));
    object oObject = NWNX_Object_StringToObject(NWNX_Events_GetEventData("OBJECT"));

    if (sCurrentEvent == "NWNX_ON_DM_GIVE_ITEM_AFTER")
    {
        string sMsg = "NAME: " + GetName(OBJECT_SELF) + " - " +
        "ACCOUNT: " + GetPCPlayerName(OBJECT_SELF) + " - " +
        "CD: " + GetPCPublicCDKey(OBJECT_SELF) + " - " +
        "IP: " + GetPCIPAddress(OBJECT_SELF) + " - " +

        "gave item (" + GetName(oObject) + ") - " +
        "Location: " + GetName(GetArea(OBJECT_SELF)) + " to " +

        "NAME: " + GetName(oTarget) + " - " +
        "ACCOUNT: " + GetPCPlayerName(oTarget) + " - " +
        "CD: " + GetPCPublicCDKey(oTarget) + " - " +
        "IP: " + GetPCIPAddress(oTarget) + " - " +
        "Location: " + GetName(GetArea(oTarget));

        ModMiscWebhook(sMsg);
    }
}
