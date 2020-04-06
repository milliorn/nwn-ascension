//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-04
//:://////////////////////////////////////////////
void main()
{
    object oCaster = GetLastSpellCaster();
    if (GetLastSpellHarmful() && GetIsPC(oCaster) && !GetIsDM(oCaster))
    {
        AssignCommand(oCaster, ClearAllActions());
        DelayCommand(6.0, AssignCommand(oCaster, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL")))));
        DelayCommand(12.0, SendMessageToPC(oCaster, "You have been sent to jail for vandalism."));
    }
}
