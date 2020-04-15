//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-014
//::///////////////////////////////////////////////
//:: FileName startarmorshop
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/9/2002 12:23:04 AM
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "NW_WSWMLS013");
    object oStore = GetNearestObjectByTag("lowarmor");

    if (GetIsObjectValid(oItem) != 0)
    {
        DestroyObject(oItem);
    }

    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
