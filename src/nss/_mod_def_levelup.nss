//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 22, 2020
//::
//:://////////////////////////////////////////////
#include "inc_discord"
#include "inc_event_module"
#include "x3_inc_string"

void main()
{
    object oPC = GetPCLevellingUp();
    int iHD = GetHitDice(oPC);

    ForceRest(oPC);
    SaveClient(oPC);

    //  Special VFX effects at level up milestones with a discord message
    switch (iHD)
    {
        case 5:
        case 10:
        case 15:
        case 20:
        case 25:
        case 30:
        case 35:
        case 40:
        case 45:
        case 50:
        case 55:
        case 60:
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
            DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_10), oPC));
            DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_20), oPC));
            DelayCommand(1.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_30), oPC));
            ModWebhook(GetName(oPC) + " has advanced to Level " + IntToString(iHD));
    }

    //  VFX effects at level up based on alignment
    int nAlign = GetAlignmentGoodEvil(oPC);
    switch (nAlign)
    {
        case ALIGNMENT_EVIL:
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_10), oPC));
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), oPC));
            DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_30), oPC));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
            break;

        case ALIGNMENT_GOOD:
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_10), oPC));
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_20), oPC));
            DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_30), oPC));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
            break;
        default:
            DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_10), oPC));
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_20), oPC));
            DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_30), oPC));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
    }
}

