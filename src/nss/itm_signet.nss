//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 29, 2020
//::
//:://////////////////////////////////////////////
#include "x2_inc_switches"

void main()
{
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE)
    {
        return;
    }

    object oActivator = GetItemActivator();
    location lSafe = GetLocation(GetWaypointByTag("Safe"));

    SetLocalLocation(GetModule(), GetPCPlayerName(oActivator), GetLocation(oActivator));

    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_BLINDDEAF), GetLocation(oActivator), 6.0);
    ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_BLINDDEAF), lSafe, 12.0);

    DelayCommand(1.0, AssignCommand(oActivator, ActionJumpToLocation(lSafe)));

    SendMessageToPC(oActivator, "You are been teleported to a pocket dimension.\nYou will return to the material plane in 60 seconds.");

    DelayCommand(60.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_BLINDDEAF), lSafe, 6.0));
    DelayCommand(61.0, AssignCommand(oActivator, ActionJumpToLocation(GetLocation(oActivator))));
}
