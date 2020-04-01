//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 27, 2020
//::
//:://////////////////////////////////////////////
#include "inc_event_module"

void main()
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), oPC);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_METEOR_SWARM), oPC);
        AssignCommand(oPC, PlaySound("as_sw_x2gong1"));
        DelayCommand(1.0, AssignCommand(oPC, PlaySound("as_sw_x2gong2")));
        DelayCommand(2.0, AssignCommand(oPC, PlaySound("vs_nx2mephm_107")));
        SaveClient(oPC);
        oPC = GetNextPC();
    }

    SpeakString("All characters have been saved by auto-reboot script.", TALKVOLUME_SHOUT);

    //  Send a message to ACN Discord Channel of the client logging out
    ModDownWebhook();

    SpeakString("<c?  >Server restart has begun.", TALKVOLUME_SHOUT);
    DelayCommand(1.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 60" + StringToRGBString(" seconds.", "777"), TALKVOLUME_SHOUT));

    DelayCommand(30.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 30" + StringToRGBString(" seconds.", "777"), TALKVOLUME_SHOUT));

    DelayCommand(45.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 15" + StringToRGBString(" seconds.", "777"), TALKVOLUME_SHOUT));

    DelayCommand(50.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 10" + StringToRGBString(" seconds.", "777"), TALKVOLUME_SHOUT));

    DelayCommand(55.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 5", TALKVOLUME_SHOUT));

    DelayCommand(56.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 4", TALKVOLUME_SHOUT));

    DelayCommand(57.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 3", TALKVOLUME_SHOUT));

    DelayCommand(58.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 2", TALKVOLUME_SHOUT));

    DelayCommand(59.0, SpeakString(StringToRGBString("Server restart in", "777")
        + " 1", TALKVOLUME_SHOUT));

    DelayCommand(60.0, SpeakString(StringToRGBString("SERVER RESTART", "700")));

    DelayCommand(61.0, BootAllPC(oPC));
    DelayCommand(61.1, SaveRedis());
    DelayCommand(61.2, WriteTimestampedLogEntry("*****SERVER RESTART*****"));
    DelayCommand(62.0, NWNX_Administration_ShutdownServer());
}
