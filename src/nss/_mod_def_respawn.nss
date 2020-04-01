#include "inc_event_module"

void main()
{
    object oRespawner = GetLastRespawnButtonPresser();

    Raise(oRespawner);
    ApplyPenalty(oRespawner);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), GetLocation(oRespawner));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oRespawner));
    DelayCommand(0.1, AssignCommand(oRespawner, ClearAllActions()));
    DelayCommand(0.2, AssignCommand(oRespawner, JumpToLocation(GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE")))));
    ExportSingleCharacter(oRespawner);
    FloatingTextStringOnCreature(StringToRGBString("Character Saved", "777"), oRespawner, FALSE);
    ExecuteScript("ws_saveall_sub", oRespawner);

    if (d6() == 1)
    {
        DestroyObject(GetItemInSlot(Random(13), oRespawner));
        SendMessageToPC(oRespawner, "Someone or Something has looted your corpse!");
    }
}

