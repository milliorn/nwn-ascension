//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-10
//:://////////////////////////////////////////////

#include "inc_area"
#include "inc_chat"
#include "inc_discord"
#include "x3_inc_string"

void main()
{
    object oEnter = GetEnteringObject(),
           oWP = GetWaypointByTag("WP_farmerbob_01");

    LokiTheft(oEnter);

    if (OBJECT_INVALID == GetNearestObjectByTag("farmerbob", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "farmerbob001", GetLocation(oWP));
    }
}
