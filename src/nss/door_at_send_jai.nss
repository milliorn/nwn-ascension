//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-03
//:://////////////////////////////////////////////

#include "inc_discord"
#include "x3_inc_string"

void main()
{
    object oAttacker = GetLastAttacker(OBJECT_SELF);
    string sName = GetName(oAttacker);

    if (GetIsPC(oAttacker) && !GetIsDM(oAttacker))
    {
        DelayCommand(6.0, AssignCommand(oAttacker, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL")))));
        SendMessageToPC(oAttacker, "You have been sent to jail for vandalism.");
        AssignCommand(oAttacker, ClearAllActions());

        SendMessageToAllDMs(StringToRGBString(sName, "777")
        + " has been sent to jail for vandalism.");

        ModMiscWebhook(sName
        + " has been sent to jail for vandalism.");
    }
}
