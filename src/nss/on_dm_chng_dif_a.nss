//NWNX_ON_DM_CHANGE_DIFFICULTY_AFTER
#include "nwnx_events"
#include "nwnx_object"
#include "inc_discord"
#include "nwnx_util"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();

    if (sCurrentEvent == "NWNX_ON_DM_CHANGE_DIFFICULTY_AFTER")
    {
        string sMsg = "NAME: " + GetName(OBJECT_SELF) + " - " +
        "ACCOUNT: " + GetPCPlayerName(OBJECT_SELF) + " - " +
        "CD: " + GetPCPublicCDKey(OBJECT_SELF) + " - " +
        "IP: " + GetPCIPAddress(OBJECT_SELF) + " - " +

        "changed difficulty to (" + NWNX_Events_GetEventData("DIFFICULTY_SETTING") + ")";

        ModMiscWebhook(sMsg);
    }
}
