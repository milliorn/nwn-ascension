//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/14/2003 4:11:25 PM
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-07
//:://////////////////////////////////////////////

#include "x3_inc_string"

void main()
{
    object oPC = GetLastUsedBy(),
           oItem = GetFirstItemInInventory(oPC);
    int x = 0,
        iLimit = 130;

    location loc;

    while (GetIsObjectValid(oItem))
    {
        x++;
        oItem = GetNextItemInInventory(oPC);
    }

    if (x <= iLimit)
    {

        loc = GetLocation(GetWaypointByTag("rainbow1"));
        AssignCommand(oPC, ActionJumpToLocation(loc));
        return;
    }
    else
    {
        loc = GetLocation(GetWaypointByTag("WP_ENCUMBRIA"));
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(loc));
        SendMessageToPC(oPC, StringToRGBString("You have "
        + IntToString(x) + " and cannot fit into the portal until you have "
        + IntToString(iLimit) + " or less items.", "700"));
    }
}
