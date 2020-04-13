//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-08
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{

    object oItem = GetFirstItemInInventory(OBJECT_SELF);

    // * if not runnning normal or better Ai then exit for performance reasons
    if (GetAILevel() == AI_LEVEL_VERY_LOW)
        return;

    // Buff ourselves up right away if we should
    if (GetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY))
    {
        // This will return TRUE if an enemy was within 40.0 m
        // and we buffed ourselves up instantly to respond --
        // simulates a spellcaster with protections enabled
        // already.
        if (TalentAdvancedBuff(40.0))
        {
            // This is a one-shot deal
            SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY, FALSE);
            // This return means we skip sending the user-defined
            // heartbeat signal in this one case.
            return;
        }
    }

    if (GetIsObjectValid(oItem))
    {
        DestroyObject(OBJECT_SELF);
        return;
    }

    else
    {
        AssignCommand(OBJECT_SELF, ClearAllActions(TRUE));
        AssignCommand(OBJECT_SELF, ActionUseSkill(SKILL_PICK_POCKET, GetNearestSeenOrHeardEnemy()));
    }
}

