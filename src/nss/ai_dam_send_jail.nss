//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-03
//:://////////////////////////////////////////////

#include "inc_chat"
#include "inc_discord"
#include "x3_inc_string"

void main()
{
    object oHostile = GetLastHostileActor();
    string sName = GetName(oHostile);

    if (GetIsPC(oHostile))
    {
        DelayCommand(0.2, AdjustReputation(oHostile, GetObjectByTag("JailGuard"), 100));
        DelayCommand(0.4, AdjustReputation(oHostile, GetObjectByTag("Merem"), 100));
        DelayCommand(0.6, AdjustReputation(oHostile, GetObjectByTag("TownWatch4"), 100));
        DelayCommand(0.8, AdjustReputation(oHostile, GetObjectByTag("warden"), 100));
        DelayCommand(1.0, AdjustReputation(oHostile, GetObjectByTag("bouncer"), 100));
        DelayCommand(1.2, AdjustReputation(oHostile, GetObjectByTag("Madman"), 100));
        DelayCommand(59.0, SendMessageToPC(oHostile, "You have been taken to jail. Speak with the guard to get out."));
        DelayCommand(60.0, AssignCommand(oHostile, JumpToObject(GetWaypointByTag("WP_JAIL"))));

        SendMessageToGM(StringToRGBString(sName, "777")
        + " has been sent to jail for attacking a non hostile NPC.");

        ModMiscWebhook(sName
        + " has been sent to jail for attacking a non hostile NPC.");
    }
}
