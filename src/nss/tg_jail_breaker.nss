//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-12
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) && !GetIsDM(oPC))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAILBREAK"))));
        SendMessageToPC(oPC, "You have been sent solitary confinement for trying to escape jail.");
    }
}
