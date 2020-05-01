//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-24
//:://////////////////////////////////////////////
//::///////////////////////////////////////////////
//:: FileName bartender
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/12/2002 1:00:33 PM
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    object o11 = GetItemPossessedBy(oPC, "NW_WSWMLS013");
    object oStore = GetNearestObjectByTag("NW_STOREBAR01");

    if (GetIsObjectValid(o11) != 0)
    {
        DestroyObject(o11);
    }

    // Either open the store with that tag or let the user know that no store exists.
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, oPC);
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
