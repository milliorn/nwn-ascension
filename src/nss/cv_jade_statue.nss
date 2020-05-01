//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-25
//:://////////////////////////////////////////////
//trapdoor_yes script by Kerico 7/7/02
//jumps the using PC to target waypoint and closes the trapdoor for next use
//place in action taken scipt in trapdoor conversation
//in 'yes' end dialog of the trapdoor

#include "nw_i0_tool"
void main()
{
    object oPC = GetPCSpeaker();

    if (!HasItem(oPC, "JadeTooth"))
    {
        BootPC(oPC);
        SendMessageToAllDMs(GetName(oPC) + " has been booted for attempting to exploit teleporter.");
        return;
    }

    DestroyObject(GetItemPossessedBy(oPC, "JadeTooth"));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_COM_HIT_NEGATIVE),  GetObjectByTag("jadestatue"));
    AssignCommand(oPC, JumpToObject(GetWaypointByTag("jadeentrance")));
}
