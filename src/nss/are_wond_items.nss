//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-12
//:://////////////////////////////////////////////

#include "inc_area"

void main()
{
    object oEnter = GetEnteringObject(),
           oWP = GetWaypointByTag("WP_Wonditems_01");
    string sName = GetName(oEnter);

    if (GetIsPC(oEnter) && !GetIsDM(oEnter))
    {
        LokiTheft(oEnter);
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("Wonditems", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "wondrousitemss", GetLocation(oWP));
    }
}
