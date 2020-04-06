//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

void main()
{
    object oHostile = GetLastHostileActor();

    if (GetIsPC(oHostile))
    {
        DelayCommand(0.2, AdjustReputation(oHostile, GetObjectByTag("JailGuard"), 100));
        DelayCommand(0.4, AdjustReputation(oHostile, GetObjectByTag("Merem"), 100));
        DelayCommand(0.6, AdjustReputation(oHostile, GetObjectByTag("TownWatch4"), 100));
        DelayCommand(0.8, AdjustReputation(oHostile, GetObjectByTag("warden"), 100));
        DelayCommand(1.0, AdjustReputation(oHostile, GetObjectByTag("bouncer"), 100));
        DelayCommand(1.2, AdjustReputation(oHostile, GetObjectByTag("Madman"), 100));
        DelayCommand(59.0, SendMessageToPC(oHostile, "You have been taken to jail. Speak with the guard to get out."));
        //jump the PC to the destination
        DelayCommand(60.0, AssignCommand(oHostile, JumpToObject(GetWaypointByTag("WP_JAIL"))));
    }
}
