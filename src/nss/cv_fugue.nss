//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-10
//:://////////////////////////////////////////////
//trapdoor_yes script by Kerico 7/7/02
//jumps the using PC to target waypoint and closes the trapdoor for next use
//place in action taken scipt in trapdoor conversation
//in 'yes' end dialog of the trapdoor

void main()
{
    //jump the PC to the destination
    AssignCommand(GetPCSpeaker(), JumpToLocation(GetStartingLocation()));
}
