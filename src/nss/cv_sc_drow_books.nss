//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-12
//::///////////////////////////////////////////////
//:: FileName saeendg

int StartingConditional()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(), "DrowDiary");
    object code = GetItemPossessedBy(GetPCSpeaker(), "EncodedMessage");
    object mess = GetItemPossessedBy(GetPCSpeaker(), "GuratszMessage");
    object mana = GetItemPossessedBy(GetPCSpeaker(), "HierarchyOfManatakloss");
    object queen = GetItemPossessedBy(GetPCSpeaker(), "TheQueensDiary");
    object tran = GetItemPossessedBy(GetPCSpeaker(), "TranslatedAncientTome");

    if (code == OBJECT_INVALID || mess == OBJECT_INVALID || mana == OBJECT_INVALID || queen == OBJECT_INVALID || tran == OBJECT_INVALID)
    {
        oItem = OBJECT_INVALID;
    }

    return oItem != OBJECT_INVALID;
}
