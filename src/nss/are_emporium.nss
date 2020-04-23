//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-15
//::
//:://////////////////////////////////////////////

#include "inc_area"
#include "x3_inc_string"

void main()
{
    object oEnter = GetEnteringObject(),
           oWeapon = GetWaypointByTag("WP_NW_INNKEEPER_01"),
           oArmor = GetWaypointByTag("WP_NW_BARTENDER_01"),
           oItem = GetWaypointByTag("WP_NW_OLDWOMAN_01");

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

    if (OBJECT_INVALID == GetNearestObjectByTag("NW_INNKEEPER", oWeapon))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "emporiumweapons", GetLocation(oWeapon));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("NW_BARTENDER", oArmor))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "emporiumarmor", GetLocation(oArmor));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("NW_OLDWOMAN", oItem))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "emporiumitems", GetLocation(oItem));
    }
}

