//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/11/2002 4:00:56 PM
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-03
//:://////////////////////////////////////////////

void main()
{
    object oil = GetItemPossessedBy(GetPCSpeaker(), "NW_WSWMLS013");

    if (GetIsObjectValid(oil) != 0)
    {
        DestroyObject(oil);
        object oStore = GetNearestObjectByTag("guardkey");

        if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
            OpenStore(oStore, GetPCSpeaker());
        return;
    }
    // Either open the store with that tag or let the user know that no store exists.

    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
