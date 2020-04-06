//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

#include "nw_i0_tool"

int StartingConditional()
{
    return GetItemPossessedBy(GetPCSpeaker(), "AnduinsStaffFragment") != OBJECT_INVALID;
}

