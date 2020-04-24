//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-23
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int iHD = GetHitDice(oPC);

    if (iHD >= 20)
    {
        SoundObjectPlay(GetObjectByTag("falling"));
        SendMessageToPC(oPC, "The floor is falling apart beneath you!.");
        ApplyEffectToObject(DURATION_TYPE_INSTANT,  EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oPC, 3.0);
        SendMessageToPC(oPC, "You have fallen into a secret chamber!");
        DelayCommand(3.0, AssignCommand(oPC, JumpToObject(GetWaypointByTag("lichentrance"))));
    }
}
