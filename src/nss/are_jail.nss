//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-06
//::
//:://////////////////////////////////////////////

//#include "inc_area"
#include "x3_inc_string"
#include "inc_area"

void main()
{
    object oEnter = GetEnteringObject(),
           oWpJail = GetWaypointByTag("WP_warden_01");


    if (IsRogueSpectre(oEnter))
    {
        return;
    }

    //  Despawn hostile creatures
    if (GetIsEncounterCreature(oEnter))
    {
        AssignCommand(oEnter, SetIsDestroyable(TRUE));
        DestroyObject(oEnter);
        return;
    }

    LokiTheft(oEnter);

    //  Stop hostile actions
    AssignCommand(oEnter, ClearAllActions(TRUE));

    if (OBJECT_INVALID == GetNearestObjectByTag("warden", oWpJail))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "warden", GetLocation(oWpJail));
    }
}
