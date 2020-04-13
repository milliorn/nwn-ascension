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

    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(8.0, RespawnObject(GetTag(OBJECT_SELF), GetObjectType(OBJECT_SELF), lLoc)));
    DestroyObject(OBJECT_SELF, 0.0);
}

