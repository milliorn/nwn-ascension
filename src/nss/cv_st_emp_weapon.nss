//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 20-04-14
//::///////////////////////////////////////////////
//:: FileName startweap1merc
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/17/2002 8:28:07 PM
//:://////////////////////////////////////////////

#include "inc_cv"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "NW_WSWMLS013");
    object oStore = GetNearestObjectByTag("weapons1");

    HasItemNW_WSWMLS013(oPC, oItem);

    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, oPC);
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
