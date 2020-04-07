//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-03
//::
//:://////////////////////////////////////////////

#include "inc_area"
#include "x3_inc_string"

void main()
{
    object oEnter = GetEnteringObject(),
           oWpPriest = GetWaypointByTag("NW_priest"),
           oWpJailor = GetWaypointByTag("WP_jailguard1_01"),
           oWpMadMan = GetWaypointByTag("WP_Madman_"),
           oWpMerem = GetWaypointByTag("WP_Merem_02"),
           oWpRowan = GetWaypointByTag("WP_leveler_02"),
           oWpGuard1 = GetWaypointByTag("WP_TownWatch1_01"),
           oWpGuard2 = GetWaypointByTag("WP_TownWatch4_06"),
           oWpGuard3 = GetWaypointByTag("WP_TownWatch3_01"),
           oWpTravel = GetWaypointByTag("WP_travel_07");

    if (GetTag(oEnter) == "RogueSpectre")
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

    CheckItemLimit(oEnter);
    LokiTheft(oEnter);

    //  Stop hostile actions
    AssignCommand(oEnter, ClearAllActions(TRUE));

    //  Reveal the map to players
    ExploreAreaForPlayer(GetArea(oEnter), oEnter);

    if (OBJECT_INVALID == GetNearestObjectByTag("priest", oWpPriest))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "ascensionhighp", GetLocation(oWpPriest));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("jailguard1", oWpJailor))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "jailguard", GetLocation(oWpJailor));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("Madman", oWpMadMan))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "madman", GetLocation(oWpMadMan));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("Merem", oWpMerem))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "merem", GetLocation(oWpMerem));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("leveler", oWpRowan))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "leveler", GetLocation(oWpRowan));
    }
    if (OBJECT_INVALID == GetNearestObjectByTag("TownWatch1", oWpGuard1))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "townwatch004", GetLocation(oWpGuard1));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("TownWatch4", oWpGuard2))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "townwatch005", GetLocation(oWpGuard2));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("TownWatch3", oWpGuard2))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "townwatch006", GetLocation(oWpGuard3));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("travel", oWpTravel))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "travelingmerchan", GetLocation(oWpTravel));
    }
}

