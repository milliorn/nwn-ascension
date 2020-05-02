//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-05-01
//::
//:://////////////////////////////////////////////
#include "X_O2_CONINCLUDE"
#include "inc_x_o2"

void main()
{
    object oLastOpener = GetLastOpener();

    SetLocalInt(OBJECT_SELF, "GT_MAX_LEVEL", 3);

    if (GetIsObjectValid(oLastOpener) == TRUE)
    {
       /*GenerateLowTreasure(oLastOpener, OBJECT_SELF);
        GenerateLowTreasure(oLastOpener, OBJECT_SELF);
        GenerateLowTreasure(oLastOpener, OBJECT_SELF);
        GenerateLowTreasure(oLastOpener, OBJECT_SELF);*/
    }

    SetLocalInt(OBJECT_SELF, "NW_DO_ONCE", 1);

    ShoutDisturbed();
    DestroyObject(OBJECT_SELF, 0.0);
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(1000.0, RespawnObject(GetTag(OBJECT_SELF), GetObjectType(OBJECT_SELF), GetLocation(OBJECT_SELF))));
}

