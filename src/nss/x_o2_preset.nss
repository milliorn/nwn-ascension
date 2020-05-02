//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-05-01
//::
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
#include "inc_x_o2"

//  Modified by AW Olorin 1-12-2004
//  Anti-GS Looting

void main()
{
    string sTag = GetTag(OBJECT_SELF);
    int iType = GetObjectType(OBJECT_SELF);
    object oLastOpener = GetLastOpener();
    location lLoc = GetLocation(OBJECT_SELF);
    float fDelay = 1800.0; // 1000 second delay

    SetPlotFlag(OBJECT_SELF, FALSE);
    DestroyObject(OBJECT_SELF);
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(fDelay, RespawnObject(sTag, iType, lLoc)));
}

