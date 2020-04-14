//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-12
//::///////////////////////////////////////////////
//::///////////////////////////////////////////////
//:: FileName sagemerc
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 9/5/2002 7:23:36 PM
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetItemPossessedBy(oPC, "NW_WSWMLS013");
    object oStore = GetNearestObjectByTag("sage");

    if (GetIsObjectValid(oItem) != 0)
        DestroyObject(oItem);

    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, oPC);
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}