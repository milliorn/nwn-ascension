//::///////////////////////////////////////////////
//:: Example XP2 OnItemEquipped
//:: x2_mod_def_equ
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnEquip Event
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
//:: Modified By: Deva Winblood
//:: Modified On: April 15th, 2008
//:: Added Support for Mounted Archery Feat penalties
//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-03-30
//:://////////////////////////////////////////////

#include "inc_event_module"
#include "x2_inc_switches"
#include "x2_inc_intweapon"
#include "x3_inc_horse"

void main()
{

    object oItem = GetPCItemLastEquipped();
    object oPC = GetPCItemLastEquippedBy();

    PrintGPValue(oItem);

    if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
    {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_EQUIP);
        int nRet = ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem), OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
            return;
        }
    }
}
