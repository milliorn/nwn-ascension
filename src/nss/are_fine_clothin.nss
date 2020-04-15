//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-14
//:://////////////////////////////////////////////

#include "inc_area"

void main()
{
    object oEnter = GetEnteringObject(),
           oWP = GetWaypointByTag("WP_NW_CREATURE_000_01");
    string sName = GetName(oEnter);

    if (GetIsPC(oEnter) && !GetIsDM(oEnter))
    {
        LokiTheft(oEnter);
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("NW_CREATURE_000", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "rennysigne", GetLocation(oWP));
    }
}
