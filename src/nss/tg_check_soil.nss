void main()
{
    object oPC = GetEnteringObject();
    object oNPC = GetNearestObjectByTag("soil");

    if (GetIsPC(oPC) && !IsInConversation(oNPC))
    {
        if (GetItemPossessedBy(oPC, "Shovel") == OBJECT_INVALID)
        {
            return;
        }
        // stop whatever we were already doing.
        AssignCommand(oNPC, ClearAllActions());
       // start talking to PC.
        AssignCommand(oNPC, ActionStartConversation(oPC));
    }
}
