//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//trapdoor_use script by Kerico 7/5/02 for doorclosed by default
//place in trapdoor on-use scipt
//opens the trapdoor and starts convo between using pc and trapdoor

void main()
{
    AssignCommand(GetLastUsedBy(), ActionStartConversation(GetObjectByTag("well1")));
}
