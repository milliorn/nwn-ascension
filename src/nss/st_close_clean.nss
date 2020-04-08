void main()
{
    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oItem))
    {
        if (!GetInfiniteFlag(oItem))
        {
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(GetFirstPC());
    }
}
