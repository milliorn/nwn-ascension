//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-06
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "PC_JAIL") == 2)
        return TRUE;

    return FALSE;
}
