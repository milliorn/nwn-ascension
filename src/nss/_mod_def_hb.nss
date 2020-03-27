#include "nwnx_time"
#include "x3_inc_string"

void main()
{
    object oModule = GetModule();

    int timekeeper = GetLocalInt(oModule, "loadtimer");
    int iUpTime = NWNX_Time_GetTimeStamp() - GetLocalInt(oModule, "RAW_BOOT_TIME");

    if (timekeeper == 0 && iUpTime > 60)
    {
        SpeakString(StringToRGBString("Server restart in", "777")
        + " 24" + StringToRGBString(" hours.", "777"), TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 1 && iUpTime > 82800)
    {
        SpeakString(StringToRGBString("Server restart in", "777")
        + " 1 " + StringToRGBString(" hour.", "777"), TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 2 && iUpTime > 84600)
    {
        SpeakString(StringToRGBString("Server restart in", "777")
        + " 30 " + StringToRGBString(" minutes.", "777"), TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 3 && iUpTime > 85500)
    {
        SpeakString(StringToRGBString("Server restart in", "777")
        + " 15 " + StringToRGBString(" minutes.", "777"), TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 4 && iUpTime > 86100)
    {
        SpeakString(StringToRGBString("Server restart in", "777")
        + " 5 " + StringToRGBString(" minutes.", "777"), TALKVOLUME_SHOUT);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
        return;
    }

    else if (timekeeper == 5 && iUpTime > 86400)
    {
        ExecuteScript("_mod_shutdown", OBJECT_SELF);
        SetLocalInt(oModule, "loadtimer", (timekeeper + 1));
    }
}

