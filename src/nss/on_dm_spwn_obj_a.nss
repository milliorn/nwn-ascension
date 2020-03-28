//NWNX_ON_DM_SPAWN_OBJECT_AFTER
#include "nwnx_events"
#include "nwnx_object"
#include "inc_discord"
#include "nwnx_util"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    object oArea = NWNX_Object_StringToObject(NWNX_Events_GetEventData("AREA"));
    object oObject = NWNX_Object_StringToObject(NWNX_Events_GetEventData("OBJECT"));

    if (sCurrentEvent == "NWNX_ON_DM_SPAWN_OBJECT_AFTER")
    {
        string sMsg = "NAME: " + GetName(OBJECT_SELF) + " - " +
        "ACCOUNT: " + GetPCPlayerName(OBJECT_SELF) + " - " +
        "CD: " + GetPCPublicCDKey(OBJECT_SELF) + " - " +
        "IP: " + GetPCIPAddress(OBJECT_SELF) + " - " +

        " spawned (" + GetName(oObject) + ") - " +
        " Location: " + GetName(oArea);

        ModMiscWebhook(sMsg);
    }
}
