//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-05-01
//::
//:://////////////////////////////////////////////
//  Modified by AW Olorin 1-12-2004
#include "inc_x_o2"

void main()
{
    SetPlotFlag(OBJECT_SELF, FALSE);

    location lLoc = GetLocation(OBJECT_SELF);
    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oItem))
    {
        DestroyObject(oItem);
        CreateObject(OBJECT_TYPE_ITEM, "brokenloot", lLoc);
        oItem = GetNextItemInInventory(OBJECT_SELF);
    }

    DestroyObject(OBJECT_SELF);
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(1800.0, RespawnObject(GetTag(OBJECT_SELF), GetObjectType(OBJECT_SELF), lLoc)));
}

