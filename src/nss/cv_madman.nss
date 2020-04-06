//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

void main()
{
    object madman = GetObjectByTag("Madman");
    AssignCommand(madman, ActionMoveAwayFromObject(GetPCSpeaker(), TRUE, 40.0));
    DelayCommand(30.0, ExecuteScript("nw_walk_wp", madman));
}
