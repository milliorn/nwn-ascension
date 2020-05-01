//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-30
//::
//:://////////////////////////////////////////////

#include "inc_area"
#include "x3_inc_string"

void main()
{
    object oEnter = GetEnteringObject(),
           oWpBartender = GetWaypointByTag("WP_bartender_01"),
           oWpBouncer = GetWaypointByTag("WP_bouncer_01"),
           oWpStripper = GetWaypointByTag("WP_stripper_01"),
           oWpGossip = GetWaypointByTag("WP_gossip_01"),
           oWpDrunk = GetWaypointByTag("WP_fbi_npc_drinker_01"),
           oWpGypsy = GetWaypointByTag("WP_NW_GYPFEMALE_01"),
           oWpRareShop = GetWaypointByTag("WP_rareshopkeeper_01"),
           oWpHooker = GetWaypointByTag("WP_NW_HOOKER01_01"),
           oWpLapDancer = GetWaypointByTag("WP_lapdancer_01");

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

    if (OBJECT_INVALID == GetNearestObjectByTag("bartender", oWpBartender))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "bartenderhalenne", GetLocation(oWpBartender));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("bouncer", oWpBouncer))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "bouncer", GetLocation(oWpBouncer));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("stripper", oWpLapDancer))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "stripper", GetLocation(oWpLapDancer));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("gossip", oWpGossip))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "gossip", GetLocation(oWpGossip));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("fbi_npc_drinker", oWpDrunk))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "fbi_npc_drinker", GetLocation(oWpDrunk));
    }
    if (OBJECT_INVALID == GetNearestObjectByTag("NW_GYPFEMALE", oWpGypsy))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "raillinepatter", GetLocation(oWpGypsy));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("rareshopkeeper", oWpRareShop))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "tertwelter", GetLocation(oWpRareShop));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("NW_HOOKER01", oWpHooker))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "shingdallennemen", GetLocation(oWpHooker));
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("lapdancer", oWpLapDancer))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "lapdancer", GetLocation(oWpLapDancer));
    }
}

