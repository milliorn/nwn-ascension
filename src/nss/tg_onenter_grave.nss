//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-04
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsObjectValid(GetObjectByTag("haunt")))
        DestroyObject(oPC);
}

