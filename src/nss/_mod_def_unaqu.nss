//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-01
//:://////////////////////////////////////////////

#include "inc_event_module"
#include "x2_inc_switches"

void main()
{
    object oItem = GetModuleItemLost();
    object oPC = GetModuleItemLostBy();
    object oArea = GetArea(oPC);

    IPRemoveAllItemProperties(oItem, DURATION_TYPE_TEMPORARY);
    PrintGPValue(oItem);

    // * Generic Item Script Execution Code
    // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
    // * it will execute a script that has the same name as the item's tag
    // * inside this script you can manage scripts for all events by checking against
    // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
    if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
    {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNACQUIRE);
        int nRet = ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem), OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
            return;
        }
    }

    if (GetIsDM(oPC))
        return;

    //  Prevent items being dropped in a state of combat GetLastWeaponUsed
    if (GetIsInCombat(oPC) && !GetStolenFlag(oItem))
    {
        if (IPGetIsMeleeWeapon(oItem) == TRUE || GetWeaponRanged(oItem) == TRUE)
        {
            CopyItem(oItem, oPC, TRUE);
            DestroyObject(oItem, 0.2);
            return;
        }
    }

    //  Prevent traps from being set in areas that has this variable.
    if (GetBaseItemType(oItem) == BASE_ITEM_TRAPKIT && GetLocalInt(oArea, "NO_TRAP") == TRUE)
    {
        CheckForTraps(oArea, oPC);
    }
}
