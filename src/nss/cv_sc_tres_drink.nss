//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-29
//::///////////////////////////////////////////////

int StartingConditional()
{
    SetLocalFloat(OBJECT_SELF, "DrinkDC", GetLocalFloat(OBJECT_SELF, "DrinkDC") + 1.5);

    int iDC = FloatToInt(GetLocalFloat(OBJECT_SELF, "DrinkDC")) + 4;
    int iChk = GetAbilityModifier(ABILITY_CONSTITUTION, GetPCSpeaker()) + d20();

    return iChk >= iDC;
}

