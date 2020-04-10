//NWNX_ON_USE_SKILL_BEFORE
#include "nwnx_events"
#include "nwnx_area"
#include "on_use_inc"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    string sMessage;
    int iStatus = StringToInt(NWNX_Events_GetEventData("SKILL_ID"));

    if (sCurrentEvent == "NWNX_ON_USE_SKILL_BEFORE")
    {
        switch (iStatus)
        {
            case SKILL_PICK_POCKET:
            {
                if (NWNX_Area_GetPVPSetting(GetArea(OBJECT_SELF)) == NWNX_AREA_PVP_SETTING_NO_PVP)
                {
                    NWNX_Events_SkipEvent();
                    AssignCommand(OBJECT_SELF, ClearAllActions());
                    DelayCommand(2.0, AssignCommand(OBJECT_SELF, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL")))));
                    FloatingTextStringOnCreature("SKILL_PICK_POCKET not allowed in No PVP areas "
                    + GetName(OBJECT_SELF)
                    + ". Now, escape from jail!", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! " + GetName(OBJECT_SELF) + " - skill spam - SKILL_PICK_POCKET";
                    SendMessageToGM(sMessage + StringToRGBString(" and has been sent to jail.", "700"));

                    ModMiscWebhook(sMessage
                    + " has been sent to jail for pickpocket abuse.");
                }

                if (GetLocalInt(OBJECT_SELF, GetName(OBJECT_SELF) + "_SKILL_PICK_POCKET"))
                {
                    NWNX_Events_SkipEvent();

                    FloatingTextStringOnCreature("No SKILL_PICK_POCKET spam allowed "
                    + GetName(OBJECT_SELF)
                    + ". SKILL_PICK_POCKET once every "
                    + FloatToString(F_PICK_POCKET)
                    + " seconds.", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! "
                    + GetName(OBJECT_SELF)
                    + " - skill spam - SKILL_PICK_POCKET";
                    SendMessageToGM(sMessage);
               }
            }

            case SKILL_HIDE:
            {
                if (GetLocalInt(OBJECT_SELF, GetName(OBJECT_SELF) + "_FEAT_HIDE_IN_PLAIN_SIGHT") && GetHasFeat(FEAT_HIDE_IN_PLAIN_SIGHT, OBJECT_SELF))
                {
                    NWNX_Events_SkipEvent();

                    FloatingTextStringOnCreature("No FEAT_HIDE_IN_PLAIN_SIGHT spam allowed "
                    + GetName(OBJECT_SELF)
                    + ". FEAT_HIDE_IN_PLAIN_SIGHT once every " + FloatToString(F_HIDE)
                    + " seconds.", OBJECT_SELF, TRUE);

                    sMessage = "WARNING! " + GetName(OBJECT_SELF) + " - feat spam - FEAT_HIDE_IN_PLAIN_SIGHT";
                    SendMessageToGM(sMessage);
                }
            }
        }
    }
}
