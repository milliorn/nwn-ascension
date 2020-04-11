//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-10
//:://////////////////////////////////////////////
void main()
{
    object oNPC = GetNearestObjectByTag("immortal");
    object oPC = GetEnteringObject();

    if (GetIsObjectValid(oNPC) && !IsInConversation(oNPC))
    {
        AssignCommand(oNPC, ClearAllActions());
        AssignCommand(oNPC, ActionMoveToObject(oPC, FALSE));
        AssignCommand(oNPC, ActionStartConversation(oPC));
    }
}
