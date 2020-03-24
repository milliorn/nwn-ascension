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

    AssignCommand(oActivator, ActionSpeakString("I am a Tournament Champion!!"));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PARALYZED), oActivator, 2880.0f);
}
