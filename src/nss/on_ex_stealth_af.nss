//NWNX_ON_EXIT_STEALTH_AFTER
#include "on_use_inc"
#include "nwnx_events"
#include "on_use_inc"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    string sName = GetName(OBJECT_SELF);

    if (!GetIsClient(OBJECT_SELF)) return;

    if (sCurrentEvent == "NWNX_ON_EXIT_STEALTH_AFTER")
    {
        if (GetStealthMode(OBJECT_SELF) == STEALTH_MODE_DISABLED)
        {
            if (!GetLocalInt(OBJECT_SELF, sName + "_FEAT_HIDE_IN_PLAIN_SIGHT") && GetHasFeat(FEAT_HIDE_IN_PLAIN_SIGHT, OBJECT_SELF))
            {
                SetLocalInt(OBJECT_SELF, sName + "_FEAT_HIDE_IN_PLAIN_SIGHT", TRUE);
                DelayCommand(F_HIDE, DeleteLocalInt(OBJECT_SELF, GetName(OBJECT_SELF) + "_FEAT_HIDE_IN_PLAIN_SIGHT"));

                SendMessageToPC(OBJECT_SELF, "FEAT_HIDE_IN_PLAIN_SIGHT disabled for " + FloatToString(F_HIDE, 0, 0) + " seconds.");
                DelayCommand(F_HIDE, SendMessageToPC(OBJECT_SELF, "FEAT_HIDE_IN_PLAIN_SIGHT enabled."));
            }
        }
    }
}
