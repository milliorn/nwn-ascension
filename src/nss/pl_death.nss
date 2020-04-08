//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//:://////////////////////////////////////////////

#include "inc_pl"

void main()
{
    location lLoc = GetLocation(OBJECT_SELF);

    SetPlotFlag(OBJECT_SELF, FALSE);

    object item = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(item))
    {
        DestroyObject(item);
        CreateObject(OBJECT_TYPE_ITEM, "brokenloot", lLoc);
        item = GetNextItemInInventory(OBJECT_SELF);
    }

    DestroyObject(OBJECT_SELF, 0.0);
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(1800.0, RespawnObject(GetTag(OBJECT_SELF), GetObjectType(OBJECT_SELF), lLoc)));
}

