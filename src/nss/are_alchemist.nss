//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-12
//:://////////////////////////////////////////////

#include "inc_area"

void main()
{
    object oEnter = GetEnteringObject(),
           oWP = GetWaypointByTag("WP_alchemist_01");
    string sName = GetName(oEnter);

    if (IsRogueSpectre(oEnter))
    {
        return;
    }

    if (GetIsPC(oEnter) && !GetIsDM(oEnter))
    {
        LokiTheft(oEnter);
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("alchemist", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "alchemist", GetLocation(oWP));
    }
}
