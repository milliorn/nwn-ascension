//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 20-04-14
//::///////////////////////////////////////////////
//:: FileName mercarmor
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/17/2002 8:36:39 PM
//:://////////////////////////////////////////////

#include "inc_cv"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "NW_WSWMLS013");
    object oStore = GetNearestObjectByTag("armorshop");

    HasItemNW_WSWMLS013(oPC, oItem);

    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, oPC);
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
