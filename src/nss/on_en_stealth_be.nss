//NWNX_ON_ENTER_STEALTH_BEFORE
#include "nwnx_events"
#include "nwnx_area"
#include "on_use_inc"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    string sName = GetName(OBJECT_SELF);
    string sMessage;

    if (!GetIsClient(OBJECT_SELF)) return;

    if (sCurrentEvent == "NWNX_ON_ENTER_STEALTH_BEFORE")
    {
        if (GetStealthMode(OBJECT_SELF) == STEALTH_MODE_DISABLED)
        {
            if (GetLocalInt(OBJECT_SELF, sName + "_FEAT_HIDE_IN_PLAIN_SIGHT") && GetHasFeat(FEAT_HIDE_IN_PLAIN_SIGHT, OBJECT_SELF))
            {
                NWNX_Events_SkipEvent();

                SendMessageToPC(OBJECT_SELF, "");
                FloatingTextStringOnCreature("No FEAT_HIDE_IN_PLAIN_SIGHT spam allowed. /n" +
                sName + ". FEAT_HIDE_IN_PLAIN_SIGHT once every " + FloatToString(F_HIDE, 0 ,0) + " seconds.", OBJECT_SELF, TRUE);
                SendMessageToPC(OBJECT_SELF, "");

                sMessage = "WARNING! " + sName + " - feat spam - FEAT_HIDE_IN_PLAIN_SIGHT";
                SendMessageToAllDMs(sMessage);
            }
        }
    }
}
