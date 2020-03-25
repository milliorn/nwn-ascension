//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 23, 2020
//::
//:://////////////////////////////////////////////
// Found at Hermits? Drow Headmaster?

#include "x2_inc_switches"

void main()
{
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE)
    {
        return;
    }

    object Activator = GetItemActivator();

    if (GetLevelByClass(CLASS_TYPE_WIZARD, Activator) >= 20 || GetLevelByClass(CLASS_TYPE_SORCERER, Activator) >= 20)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSummonCreature("dancing_blade", VFX_IMP_UNSUMMON, 1.0), Activator, 120000.0);
        return;
    }

    else if (GetLevelByClass(CLASS_TYPE_WIZARD, Activator) <= 19 && GetLevelByClass(CLASS_TYPE_SORCERER, Activator) <= 19)
    {
        if (GetLocalInt(GetArea(Activator), "NO_CROWN"))
        {
            CreateObject(OBJECT_TYPE_CREATURE, "dancingscimit001", GetLocation(Activator));
            return;
        }
        else
        {
            SendMessageToPC(Activator, "You are not powerful enough to use this item.");
            return;
        }
    }

    else
    {
        SendMessageToPC(Activator, "You are unsure on how to use the power of the sheath.");
    }
}
