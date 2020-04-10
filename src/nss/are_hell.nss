//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-07
//:://////////////////////////////////////////////
// 12-22-2003 AW Olorin
// Remove an Immortal's immortality if they enter Hell.

#include "inc_area"
#include "inc_chat"
#include "inc_discord"
#include "x3_inc_string"

void main()
{
    object oEnter = GetEnteringObject(),
           oWP = GetWaypointByTag("WP_SATAN");
    string sName = GetName(oEnter);

    if (GetIsPC(oEnter) && !GetIsDM(oEnter))
    {
        SendMessageToGM(StringToRGBString(sName, "777") + " has entered Hell.");
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DEMON_HAND, 0), oEnter));
        ModMiscWebhook(sName + " has entered Hell.");
        LokiTheft(oEnter);
    }

    if (OBJECT_INVALID == GetNearestObjectByTag("Satan", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "satan", GetLocation(oWP));
    }
}
