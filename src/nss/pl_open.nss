//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

#include "inc_pl"
#include "inc_gsloot"
#include "NW_O2_CONINCLUDE"


//  Modified by AW Olorin 1-12-2004
//  Anti-GS Looting

void main()
{
    object oLastOpener = GetLastOpener();
    location lLoc = GetLocation(OBJECT_SELF);

    SetPlotFlag(OBJECT_SELF, FALSE);
    DestroyObject(OBJECT_SELF, 0.0);

    if (GS_Check(oLastOpener, 1))
    {
        RogueSpectreSpawn(oLastOpener);
        DropNote(lLoc);
        DestroyInventory(OBJECT_SELF);
    }
//1800
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(8.0, RespawnObject(GetTag(OBJECT_SELF), GetObjectType(OBJECT_SELF), lLoc)));
}

