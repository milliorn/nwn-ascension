//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    int iHD = GetHitDice(oPC);
    TakeGoldFromCreature(iHD * 150, oPC, TRUE);
}

