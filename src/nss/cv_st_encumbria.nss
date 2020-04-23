//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/14/2003 4:11:25 PM
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-07
//:://////////////////////////////////////////////

#include "inc_cv"

void main()
{
    object oPC = GetPCSpeaker(),
           o11 = GetItemPossessedBy(oPC, "NW_WSWMLS013"),
           oStore = GetNearestObjectByTag("merch_gypsy");

    HasItemNW_WSWMLS013(oPC, o11);

    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
