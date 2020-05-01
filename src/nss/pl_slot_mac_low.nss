//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-24
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastUsedBy();
    int iGold = GetGold(oPC);
    int iSlot = GetLocalInt(OBJECT_SELF, "iSlot");
    int iRoll = d100();

    if (iSlot > 0)
    {
        SendMessageToPC(oPC, "You must wait a moment to try again.");
        return;
    }

    SetLocalInt(OBJECT_SELF, "iSlot", 1);
    DelayCommand(3.5, SetLocalInt(OBJECT_SELF, "iSlot", 0));

    if (iGold < 20)
    {
        SendMessageToPC(oPC, "You do not have enough gold to play this slot machine.");
        return;
    }

    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);

    AssignCommand(oPC, TakeGoldFromCreature(200, oPC, TRUE));

    if (iRoll == 1)
    {
        if (d6() == 1)
        {
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WORD), oPC));
            DelayCommand(3.0, SendMessageToPC(oPC, "You have won The Jackpot!!!"));
            CreateItemOnObject("nw_it_gem014", oPC, 1);
            CreateItemOnObject("nw_it_gem004", oPC, 1);
            CreateItemOnObject("nw_it_gem002", oPC, 1);
            CreateItemOnObject("nw_it_gem007", oPC, 1);
            CreateItemOnObject("nw_it_gem001", oPC, 1);
            return;
        }
        else
        {
            DelayCommand(3.0, SendMessageToPC(oPC, "You have won a Brilliant Topaz!!!"));
            CreateItemOnObject("brillianttopaz", oPC, 1);
            return;
        }
    }
    else if (iRoll >= 2 && iRoll <= 6)
    {
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_10), oPC));

        if (iRoll == 2)
        {
            DelayCommand(3.0, SendMessageToPC(oPC, "You have won an Adventurine!"));
            CreateItemOnObject("nw_it_gem014", oPC, 1);
            return;
        }
        if (iRoll == 3)
        {
            DelayCommand(3.0, SendMessageToPC(oPC, "You have won a Phenalope!"));
            CreateItemOnObject("nw_it_gem004", oPC, 1);
            return;
        }
        if (iRoll == 4)
        {
            DelayCommand(3.0, SendMessageToPC(oPC, "You have won a Fire Agate!"));
            CreateItemOnObject("nw_it_gem002", oPC, 1);
            return;
        }
        if (iRoll == 5)
        {
            DelayCommand(3.0, SendMessageToPC(oPC, "You have won a Malachite!"));
            CreateItemOnObject("nw_it_gem007", oPC, 1);
            return;
        }
        if (iRoll == 6)
        {
            DelayCommand(3.0, SendMessageToPC(oPC, "You have won a Greenstone!"));
            CreateItemOnObject("nw_it_gem001", oPC, 1);
            return;
        }
    }
    else
    {
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_10), oPC));
        DelayCommand(3.0, SendMessageToPC(oPC, "You have won nothing, please try again."));
    }
}

