//NWNX_ON_USE_FEAT_BEFORE
//Called Shot, Improved KD, Improved Disarm, KD, Disarm, Hips
#include "nwnx_events"
#include "nwnx_area"
#include "on_use_inc"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    string sMessage;
    string sEvent = NWNX_Events_GetEventData("FEAT_ID");
    int iStatus = StringToInt(sEvent);

    if (!GetIsClient(OBJECT_SELF)) return;

    if (sCurrentEvent == "NWNX_ON_USE_FEAT_BEFORE")
    {
        switch (iStatus)
        {
            case FEAT_CALLED_SHOT:
            {
                if (GetLocalInt(OBJECT_SELF, sEvent))
                {
                    NWNX_Events_SkipEvent();

                    FloatingTextStringOnCreature("No FEAT_CALLED_SHOT spam allowed " +
                    GetName(OBJECT_SELF) + ". FEAT_CALLED_SHOT once every 6 seconds.", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! " + GetName(OBJECT_SELF) + " - feat spam - FEAT_CALLED_SHOT";
                    SendMessageToGM(sMessage);
                }
            }

            case FEAT_DISARM:
            {
                if (GetLocalInt(OBJECT_SELF, sEvent))
                {
                    NWNX_Events_SkipEvent();

                    FloatingTextStringOnCreature("No FEAT_DISARM spam allowed " +
                    GetName(OBJECT_SELF) + ". FEAT_DISARM once every 6 seconds.", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! " + GetName(OBJECT_SELF) + " - feat spam - FEAT_DISARM";
                    SendMessageToGM(sMessage);
                }
            }
            case FEAT_IMPROVED_DISARM:
            {
                if (GetLocalInt(OBJECT_SELF, sEvent))
                {
                    NWNX_Events_SkipEvent();

                    FloatingTextStringOnCreature("No FEAT_IMPROVED_DISARM spam allowed " +
                    GetName(OBJECT_SELF) + ". FEAT_IMPROVED_DISARM once every 6 seconds.", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! " + GetName(OBJECT_SELF) + " - feat spam - FEAT_IMPROVED_DISARM";
                    SendMessageToGM(sMessage);
                }
            }

            case FEAT_KNOCKDOWN:
            {
                if (GetLocalInt(OBJECT_SELF, sEvent))
                {
                    NWNX_Events_SkipEvent();

                    FloatingTextStringOnCreature("No FEAT_KNOCKDOWN spam allowed " +
                    GetName(OBJECT_SELF) + ". FEAT_KNOCKDOWN once every 6 seconds.", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! " + GetName(OBJECT_SELF) + " - feat spam - FEAT_KNOCKDOWN";
                    SendMessageToGM(sMessage);
                }
            }

            case FEAT_IMPROVED_KNOCKDOWN:
            {
                if (GetLocalInt(OBJECT_SELF, sEvent))
                {
                    NWNX_Events_SkipEvent();

                    FloatingTextStringOnCreature("No FEAT_IMPROVED_KNOCKDOWN spam allowed " +
                    GetName(OBJECT_SELF) + ". FEAT_IMPROVED_KNOCKDOWN once every 6 seconds.", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! " + GetName(OBJECT_SELF) + " - feat spam - FEAT_IMPROVED_KNOCKDOWN";
                    SendMessageToGM(sMessage);
                }
            }
        }
    }
}
