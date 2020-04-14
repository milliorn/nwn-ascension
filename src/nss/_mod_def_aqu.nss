//:://////////////////////////////////////////////
//::
//:: Created By: AW Olorin
//:: Created On: 2004-01-21
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-03-22
//:://////////////////////////////////////////////

#include "inc_event_module"

void main()
{
    object oItem = GetModuleItemAcquired();
    object oFrom = GetModuleItemAcquiredFrom();
    object oPC = GetModuleItemAcquiredBy();

    string sPC = GetName(oPC);
    string sItem = GetName(oItem);

    PrintGPValue(oPC);

    //  Clear all Temp Item Properties so they don't become permanent
    IPRemoveAllItemProperties(oItem, DURATION_TYPE_TEMPORARY);

    //  If DM we break the script
    if (GetIsDM(oPC)) return;

    //  This checks to see if the creature acquiring the item is a valid
    //  PoA NPC thief (Such as Quickling, Rogue Spec, etc and if so
    //  We record the legitimate owner
    if (IsThiefNPC(oPC))
        SetLocalString(oItem, "SpectreSteal", GetName(oFrom));

    if (GetIsPC(oPC) && (!(GetIsDM(oPC))))
    {
        //  Once the victim gets his own item back from an NPC
        //  Steal, we reset the SpectreSteal Variable here, and
        //  Untag the item as being stolen.
        if (GetLocalString(oItem, "SpectreSteal") == GetName(oPC))
        {
            SetLocalString(oItem, "SpectreSteal", "");
            SetStolenFlag(oItem, FALSE);
        }
    }

    FixBarterExploit(oFrom, oPC);
    LootMessage(sItem, sPC, oFrom, oPC);
}
