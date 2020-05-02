//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-05-01
//::
//:://////////////////////////////////////////////
#include "nw_o2_coninclude"
#include "inc_x_o2"

void main()
{
    object oLastOpener = GetLastOpener();
    location lLoc = GetLocation(OBJECT_SELF);
    string sTag = GetTag(OBJECT_SELF);
    int iType = GetObjectType(OBJECT_SELF);
    float fDelay = 1000.0;

    SetLocalInt(OBJECT_SELF, "GT_MAX_LEVEL", 3);

    if (GetIsObjectValid(oLastOpener))
    {
        //GenerateLowTreasure(oLastOpener, OBJECT_SELF);
    }

    SetLocalInt(OBJECT_SELF, "NW_DO_ONCE", 1);

    ShoutDisturbed();
    DestroyObject(OBJECT_SELF, 0.0);
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(fDelay, RespawnObject(sTag, iType, lLoc)));
}

