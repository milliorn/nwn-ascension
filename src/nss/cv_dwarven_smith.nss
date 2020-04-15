//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-014
//::///////////////////////////////////////////////
//:: FileName betlecolectrewar
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/13/2002 5:21:31 PM
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oItemToTake = GetItemPossessedBy(oPC, "NW_IT_MSMLMISC08");

    if (GetIsObjectValid(oItemToTake) != 0)
    {
        DestroyObject(oItemToTake);
        GiveGoldToCreature(oPC, 5);
    }
}
