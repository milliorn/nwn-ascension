#include "inc_event_module"

void main()
{
    object oDied = GetLastPlayerDied(),
           oKiller = GetLastHostileActor(oDied);

    string sArea = GetTag(GetArea(oDied)),
           sDead = GetName(oDied),
           sKiller = GetName(oKiller);

    //  Reset Faction Reputation to PC
    SetFactionsFriendly(oDied);

    if (sArea == "TournamentArena")
    {
        //Send the 2 PC's a message
        DelayCommand(1.0, FloatingTextStringOnCreature("You Win", oKiller, FALSE));
        DelayCommand(1.0, FloatingTextStringOnCreature("You Lose", oDied, FALSE));

        //Shout server Arena message
        SpeakString(StringToRGBString(sDead, "777")
        + " lost a duel to "
        + StringToRGBString(sKiller, "777")
        + " in the Tournament Arena.", TALKVOLUME_SHOUT);

        AssignCommand(oKiller, ClearAllActions(TRUE));
        Raise(oDied);
        return;
    }

    //  Auto Raise PC if they die in these areas
    else if (GetLocalInt(GetArea(oDied), "PC_AUTO_RAISE"))
    {
        AssignCommand(oKiller, ClearAllActions(TRUE));
        Raise(oDied);
        return;
    }

    //  Do death event
    else
    {
        //ExecuteScript("sf_bounty", OBJECT_SELF);
        DelayCommand(2.5, PopUpDeathGUIPanel(oDied, TRUE, TRUE, 0, "Respawning will lose you 100xp per character level and 15% of your total gold."));
        DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), OBJECT_SELF));
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE), OBJECT_SELF));
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_L), OBJECT_SELF));
    }
}

