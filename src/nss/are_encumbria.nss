//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-07
//::
//:://////////////////////////////////////////////

#include "inc_area"

void main()
{
    object oEnter = GetEnteringObject(),
           oItem = GetFirstItemInInventory(oEnter),
           oWP = GetWaypointByTag("WP_NW_GYPSY002_01");
    int x = 0,
        iLimit = 130;
    location loc;

    LokiTheft(oEnter);

    while (GetIsObjectValid(oItem))
    {
        x++;
        oItem = GetNextItemInInventory(oEnter);
    }

    if (GetIsPC(oEnter) && !GetIsDM(oEnter))
    {
        SendMessageToPC(oEnter, StringToRGBString("You have " + IntToString(x)
        + " and cannot enter  the portal until you have "
        + IntToString(iLimit) + " or less items.", "700"));
    }

    AssignCommand(oEnter, ClearAllActions(TRUE));

    if (OBJECT_INVALID == GetNearestObjectByTag("NW_GYPSY002", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "gypsyaerthel", GetLocation(oWP));
    }
}
