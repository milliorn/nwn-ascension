//trapdoor_yes script by Kerico 7/7/02
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-06
//:://////////////////////////////////////////////
void main()
{
    object oSpeaker = GetPCSpeaker();
    AssignCommand(oSpeaker, JumpToObject(GetWaypointByTag("WP_JAIL_ENTRANCE")));
    SetLocalInt(oSpeaker, "PC_JAIL", 0);
}
