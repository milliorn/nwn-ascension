//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 23, 2020
//::
//:://////////////////////////////////////////////
#include "x2_inc_switches"

void main()
{
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE)
    {
        return;
    }

    object oActivated = GetItemActivated();
    object oTarget = GetItemActivatedTarget();
    object oActivator = GetItemActivator();

    location oTargetLocation = GetItemActivatedTargetLocation();
}
