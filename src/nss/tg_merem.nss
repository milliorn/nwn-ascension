void main()
{
    object oPC = GetEnteringObject();

    // replace this tag string with the tag string of your NPC.
    object oNPC = GetNearestObjectByTag("Merem");

    // make sure we found the NPC.  May be dead, etc.

    if (GetIsPC(oPC))
    {
        // check to make sure NPC isn't already talking to somebody.
        if (!IsInConversation(oNPC))
        {

            // stop whatever we were already doing.
            AssignCommand(oNPC, ClearAllActions());

            // walk NPC to the PC.  If you want NPC to run change FALSE to TRUE.

            // start talking to PC.
            AssignCommand(oNPC, ActionStartConversation(oPC, "", TRUE));
        }
    }

    // if you want this script to only run the first time anybody
    // sets it off, uncomment the line below:
    //DestroyObject(OBJECT_SELF);
}

