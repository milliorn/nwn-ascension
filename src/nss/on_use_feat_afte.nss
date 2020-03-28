//NWNX_ON_USE_FEAT_AFTER
//Called Shot, Improved KD, Improved Disarm, KD, Disarm, Hips
#include "nwnx_events"
#include "on_use_inc"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    string sEvent = NWNX_Events_GetEventData("FEAT_ID");
    int iStatus = StringToInt(sEvent);

    if (!GetIsClient(OBJECT_SELF)) return;

    if (sCurrentEvent == "NWNX_ON_USE_FEAT_AFTER")
    {
        switch (iStatus)
        {
            case FEAT_CALLED_SHOT:
            {
                if (!GetLocalInt(OBJECT_SELF, sEvent))
                {
                    SetLocalInt(OBJECT_SELF, sEvent, TRUE);
                    DelayCommand(6.0, DeleteLocalInt(OBJECT_SELF, sEvent));
                    SendMessageToPC(OBJECT_SELF, "FEAT_CALLED_SHOT disabled for 6 seconds");
                    DelayCommand(6.0, SendMessageToPC(OBJECT_SELF, "FEAT_CALLED_SHOT enabled."));
                }
            }

            case FEAT_DISARM:
            {
                if (!GetLocalInt(OBJECT_SELF, sEvent))
                {
                    SetLocalInt(OBJECT_SELF, sEvent, TRUE);
                    DelayCommand(6.0, DeleteLocalInt(OBJECT_SELF, sEvent));
                    SendMessageToPC(OBJECT_SELF, "FEAT_DISARM disabled for 6 seconds");
                    DelayCommand(6.0, SendMessageToPC(OBJECT_SELF, "FEAT_DISARM enabled."));
                }
            }

            case FEAT_IMPROVED_DISARM:
            {
                if (!GetLocalInt(OBJECT_SELF, sEvent))
                {
                    SetLocalInt(OBJECT_SELF, sEvent, TRUE);
                    DelayCommand(6.0, DeleteLocalInt(OBJECT_SELF, sEvent));
                    SendMessageToPC(OBJECT_SELF, "FEAT_IMPROVED_DISARM disabled for 6 seconds");
                    DelayCommand(6.0, SendMessageToPC(OBJECT_SELF, "FEAT_IMPROVED_DISARM enabled."));
                }
            }
            case FEAT_KNOCKDOWN:
            {
                if (!GetLocalInt(OBJECT_SELF, sEvent))
                {
                    SetLocalInt(OBJECT_SELF, sEvent, TRUE);
                    DelayCommand(6.0, DeleteLocalInt(OBJECT_SELF, sEvent));
                    SendMessageToPC(OBJECT_SELF, "FEAT_KNOCKDOWN disabled for 6 seconds");
                    DelayCommand(6.0, SendMessageToPC(OBJECT_SELF, "FEAT_KNOCKDOWN enabled."));
                }
            }

            case FEAT_IMPROVED_KNOCKDOWN:
            {
                if (!GetLocalInt(OBJECT_SELF, sEvent))
                {
                    SetLocalInt(OBJECT_SELF, sEvent, TRUE);
                    DelayCommand(6.0, DeleteLocalInt(OBJECT_SELF, sEvent));
                    SendMessageToPC(OBJECT_SELF, "FEAT_IMPROVED_KNOCKDOWN disabled for 6 seconds");
                    DelayCommand(6.0, SendMessageToPC(OBJECT_SELF, "FEAT_IMPROVED_KNOCKDOWN enabled."));
                }
            }
        }
    }
}
