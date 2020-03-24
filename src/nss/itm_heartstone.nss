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

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE, 100), oActivator, 60.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_ELEMENTAL_SHIELD), oActivator, 60.0);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_FLAME_S), oActivator, 60.0);
}
