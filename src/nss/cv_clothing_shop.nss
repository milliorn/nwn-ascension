//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 20-04-14
//::///////////////////////////////////////////////
//:: FileName clothesmerchant
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/14/2002 8:28:23 PM
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "NW_WSWMLS013");
    object oStore = GetNearestObjectByTag("clothingshopmerc");

    if (GetIsObjectValid(oItem) != 0)
    {
        DestroyObject(oItem);
    }

    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, oPC);
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
