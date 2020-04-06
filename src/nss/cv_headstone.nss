//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/13/2002 12:14:41 PM
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();

    AdjustAlignment(oPC, ALIGNMENT_GOOD, 100);

    object oItemToTake = GetItemPossessedBy(oPC, "HumanSacrifice");
    if (GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
