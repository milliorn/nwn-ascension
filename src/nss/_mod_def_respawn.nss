//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-03-31
//:://////////////////////////////////////////////
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
    SaveClient(oRespawner);
    PlayVoiceChat(VOICE_CHAT_GOODBYE, oRespawner);

    if (d6() == 1)
    {
        DrowCorpseLoot(oRespawner);
        SendMessageToPC(oRespawner, "Someone or something has looted your corpse!");
    }
}

