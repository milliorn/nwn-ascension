//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
//:: Modified By: Deva Winblood
//:: Modified On: April 15th, 2008
//:: Added Support for Mounted Archery Feat penalties
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-01
//:://////////////////////////////////////////////

#include "inc_event_module"
#include "x2_inc_switches"

void main()
{
    object oItem = GetPCItemLastUnequipped();
    object oPC = GetPCItemLastUnequippedBy();

    PrintGPValue(oItem);

    // -------------------------------------------------------------------------
    // Generic Item Script Execution Code
    // If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
    // it will execute a script that has the same name as the item's tag
    // inside this script you can manage scripts for all events by checking against
    // GetUserDefinedItemEventNumber(). See x2_it_example.nss
    // -------------------------------------------------------------------------
    if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
    {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNEQUIP);
        int nRet = ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem), OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
            return;
        }
    }
}
