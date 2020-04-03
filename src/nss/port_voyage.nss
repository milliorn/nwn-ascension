void main()
{
    object oPC = GetEnteringObject();

    if (GetIsDM(oPC))
        return;

    AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_VOYAGE"))));
}
