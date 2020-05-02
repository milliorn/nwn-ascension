//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-05-01
//::
//:://////////////////////////////////////////////
//  Modified by AW Olorin 1-12-2004
//  Anti-GS Looting

#include "inc_x_o2"

void main()
{
    location lLoc = GetLocation(OBJECT_SELF);
    CreateObject(OBJECT_TYPE_ITEM, "brokenloot", lLoc);
    DestroyObject(OBJECT_SELF, 0.0);
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(1000.0, RespawnObject(GetTag(OBJECT_SELF), GetObjectType(OBJECT_SELF), lLoc)));
}

