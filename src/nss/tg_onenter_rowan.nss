//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-03
//::
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetEnteringObject();
    object oLeveler = GetObjectByTag("leveler");

    if (GetIsPC(oPC) && GetXP(oPC) < 1000)
    {
        AssignCommand(oLeveler, ClearAllActions());
        AssignCommand(oLeveler, ActionMoveToObject(oPC, TRUE));
        AssignCommand(oLeveler, ActionStartConversation(oPC, "", TRUE));
    }
}




