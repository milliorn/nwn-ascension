#include "nw_i0_tool"
void main()
{
    object oPC = GetEnteringObject(),
           oBanker = GetWaypointByTag("WP_CaptainMaleyReynolds");

    if (HasItem(oPC, "itm_teleport") || GetIsDM(oPC))
    {
        AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("voyage"))));
        return;
    }

    if (!GetIsObjectValid(GetNearestObjectByTag("CaptainMaleyReynolds", oBanker)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "captainmaleyreyn", GetLocation(oBanker));
    }
}
