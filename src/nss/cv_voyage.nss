void main()
{
    object oPC = GetPCSpeaker();
    AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("WP_HOME"))));
    CreateItemOnObject("itm_teleport", oPC);
    CreateItemOnObject("itm_sequencer", oPC);
    GiveGoldToCreature(oPC, 300);
    SetXP(oPC, 1);
}
