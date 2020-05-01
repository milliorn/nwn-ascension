//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-29
//::///////////////////////////////////////////////
void main()
{
    SetLocalFloat(OBJECT_SELF, "DrinkDC", 0.0);
    object oPC = GetPCSpeaker();
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oPC, 10.0));
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SLEEP), oPC));
}
