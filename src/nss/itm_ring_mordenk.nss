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

    object oActivator = GetItemActivator();

    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSpellResistanceIncrease(100), oActivator, 300.0));
    DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_SPELLTURNING), oActivator, 300.0));
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_SANCTUARY), oActivator, 300.0));
}
