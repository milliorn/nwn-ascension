//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

#include "nw_i0_tool"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    return GetGold(oPC) >= GetHitDice(oPC) * 150;
}

