//NWNX_ON_USE_SKILL_AFTER
#include "on_use_inc"
#include "nwnx_events"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    int iStatus = StringToInt(NWNX_Events_GetEventData("SKILL_ID"));

    if (sCurrentEvent == "NWNX_ON_USE_SKILL_AFTER")
    {
        switch (iStatus)
        {
            case SKILL_PICK_POCKET:
            {
                if (!GetLocalInt(OBJECT_SELF, GetName(OBJECT_SELF) + "_SKILL_PICK_POCKET"))
                {
                    SetLocalInt(OBJECT_SELF, GetName(OBJECT_SELF) + "_SKILL_PICK_POCKET", TRUE);
                    DelayCommand(F_PICK_POCKET, DeleteLocalInt(OBJECT_SELF, GetName(OBJECT_SELF) + "_SKILL_PICK_POCKET"));

                    SendMessageToPC(OBJECT_SELF, "SKILL_PICK_POCKET disabled for " + FloatToString(F_PICK_POCKET) + " seconds.");
                    DelayCommand(F_PICK_POCKET, SendMessageToPC(OBJECT_SELF, "SKILL_PICK_POCKET enabled."));
                }
            }
        }
    }
}
