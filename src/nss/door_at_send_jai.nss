//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-03
//:://////////////////////////////////////////////
void main()
{
    object oAttacker = GetLastAttacker(OBJECT_SELF);
    if (GetIsPC(oAttacker) && !GetIsDM(oAttacker))
    {
        DelayCommand(6.0, AssignCommand(oAttacker, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL")))));
        SendMessageToPC(oAttacker, "You have been sent to jail for vandalism.");
        AssignCommand(oAttacker, ClearAllActions());
    }
}
