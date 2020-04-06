//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/13/2002 12:14:41 PM
//:://////////////////////////////////////////////
//trapdoor_yes script by Kerico 7/7/02
//jumps the using PC to target waypoint and closes the trapdoor for next use
//place in action taken scipt in trapdoor conversation
//in 'yes' end dialog of the trapdoor

void main()
{
    //jump the PC to the destination
    AssignCommand(GetPCSpeaker(), JumpToObject(GetWaypointByTag("sewerentrance")));
}
