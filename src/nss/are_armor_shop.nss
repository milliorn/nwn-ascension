//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-14
//::
//:://////////////////////////////////////////////

#include "inc_area"
#include "x3_inc_string"

void main()
{
    object oEnter = GetEnteringObject(),
           oWp1 = GetWaypointByTag("WP_armorshop_01"),
           oWp2 = GetWaypointByTag("WP_beetlecollect_01");

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
    CheckItemLimit(oEnter);

    //  Stop hostile actions
    AssignCommand(oEnter, ClearAllActions(TRUE));

    //  Reveal the map to players
    ExploreAreaForPlayer(GetArea(oEnter), oEnter);

    if (OBJECT_INVALID == GetNearestObjectByTag("armorshop", oWp1))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "armorsmithhull", GetLocation(oWp1));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("beetlecollect", oWp2))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "dwarvenbeetlecol", GetLocation(oWp2));
    }
}
