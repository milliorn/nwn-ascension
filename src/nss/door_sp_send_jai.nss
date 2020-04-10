//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-04
//:://////////////////////////////////////////////

#include "inc_chat"
#include "inc_discord"
#include "x3_inc_string"

void main()
{
    object oCaster = GetLastSpellCaster();
    string sName = GetName(oCaster);

    if (GetLastSpellHarmful() && GetIsPC(oCaster) && !GetIsDM(oCaster))
    {
        AssignCommand(oCaster, ClearAllActions());
        DelayCommand(6.0, AssignCommand(oCaster, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL")))));
        DelayCommand(12.0, SendMessageToPC(oCaster, "You have been sent to jail for vandalism."));

        SendMessageToGM(StringToRGBString(sName, "777")
        + " has been sent to jail for vandalism.");

        ModMiscWebhook(sName
        + " has been sent to jail for vandalism.");
    }
}
