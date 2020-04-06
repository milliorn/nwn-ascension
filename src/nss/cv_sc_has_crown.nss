//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

#include "nw_i0_tool"

int StartingConditional()
{
    return GetItemPossessedBy(GetPCSpeaker(), "ImmortalCrown2") != OBJECT_INVALID;
}

