//NWNX_ON_EXAMINE_OBJECT_BEFORE
#include "nwnx_events"
#include "nwnx_object"
#include "inc_ai"
#include "on_use_inc"

void main()
{
    string sCurrentEvent = NWNX_Events_GetCurrentEvent();
    object oNPC =  NWNX_Object_StringToObject(NWNX_Events_GetEventData("EXAMINEE_OBJECT_ID"));
    int iHD = GetHitDice(oNPC);

    if (!GetIsClient(OBJECT_SELF)) return;

    if (sCurrentEvent == "NWNX_ON_EXAMINE_OBJECT_BEFORE")
    {
        if (GetIsObjectValid(oNPC) && GetIsReactionTypeHostile(oNPC) && GetObjectType(oNPC) == OBJECT_TYPE_CREATURE)
        {
            if (GetSkillRank(SKILL_LORE) >= iHD)
            {
                PrintCRValue(oNPC);
            }

            else
            {
                FloatingTextStringOnCreature("You need Lore Skill score of " + IntToString(iHD) +
                " to refresh this creatures current stats.", OBJECT_SELF, FALSE);
            }
        }
    }
}
