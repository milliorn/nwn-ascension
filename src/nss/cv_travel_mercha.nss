//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 12/15/2002 5:53:04 PM
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-03
//:://////////////////////////////////////////////

#include "inc_cv"


void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "NW_WSWMLS013");

    HasItemNW_WSWMLS013(oPC, oItem);

    oItem = GetItemPossessedBy(oPC, "BlueSkies");
    if (GetIsObjectValid(oItem) != 0)
    {
        DestroyObject(oItem);
    }

    oItem = GetItemPossessedBy(oPC, "UndeadLeech");
    if (GetIsObjectValid(oItem) != 0)
    {
        DestroyObject(oItem);
    }

    oItem = GetItemPossessedBy(oPC, "WBWMSH005");
    if (GetIsObjectValid(oItem) != 0)
    {
        DestroyObject(oItem);
    }

    oItem = GetItemPossessedBy(oPC, "NW_WBWMSL008");
    if (GetIsObjectValid(oItem) != 0)
    {
        DestroyObject(oItem);
    }

    object oStore = GetNearestObjectByTag("rainmerc");
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
