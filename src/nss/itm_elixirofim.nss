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

    SetPlotFlag(oActivator, TRUE);
    DelayCommand(600.0, SetPlotFlag(oActivator, FALSE));
    DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_ELEMENTAL_SHIELD), oActivator, 600.0));
    DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE), oActivator, 600.0));
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PARALYZED), oActivator, 600.0));
    DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PROT_PREMONITION), oActivator, 600.0));
}
