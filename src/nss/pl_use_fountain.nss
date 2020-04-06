//trapdoor_use script by Kerico 7/5/02 for doorclosed by default
//place in trapdoor on-use scipt
//opens the trapdoor and starts convo between using pc and trapdoor

void main()
{
    //start trapdoor conversation
    AssignCommand (GetLastUsedBy(), ActionStartConversation(GetObjectByTag("telefountain2"), "", TRUE));
}
