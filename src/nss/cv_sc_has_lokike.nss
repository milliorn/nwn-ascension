//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/13/2002 12:14:41 PM
//:://////////////////////////////////////////////

int StartingConditional()
{
    return GetItemPossessedBy(GetPCSpeaker(), "lokikey") != OBJECT_INVALID;
}

