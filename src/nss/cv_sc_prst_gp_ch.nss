//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    return GetGold(oPC) >= GetHitDice(oPC) * 150;
}

