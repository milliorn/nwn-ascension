//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-04
//:://////////////////////////////////////////////

int StartingConditional()
{
    return GetItemPossessedBy(GetPCSpeaker(), "rainbowstone") != OBJECT_INVALID;
}

