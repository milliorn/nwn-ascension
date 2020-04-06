void main()
{
    object oPC = GetEnteringObject();

    if (GetLocalInt(OBJECT_SELF, "haunt") != 0 || GetIsPC(oPC) == FALSE || GetIsNight() == FALSE && GetIsDusk() == FALSE)
    {
        return;
    }

    CreateObject(OBJECT_TYPE_CREATURE, "haunt", GetLocation(oPC), TRUE);
}
