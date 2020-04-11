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
           oWP = GetWaypointByTag("WP_immortal_fugue");
    string sName = GetName(oEnter);

    if (GetIsPC(oEnter) && !GetIsDM(oEnter))
    {
        SendMessageToGM(StringToRGBString(sName, "777") + " has entered Fugue.");
        LokiTheft(oEnter);
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("immortal", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "immortal", GetLocation(oWP));
    }
}
