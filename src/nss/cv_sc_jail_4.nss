//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-06
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "PC_JAIL") == 3)
        return TRUE;

    return FALSE;
}
