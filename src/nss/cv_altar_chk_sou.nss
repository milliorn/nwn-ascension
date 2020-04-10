//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//:://////////////////////////////////////////////
//trapdoor_yes script by Kerico 7/7/02
//jumps the using PC to target waypoint and closes the trapdoor for next use
//place in action taken scipt in trapdoor conversation
//in 'yes' end dialog of the trapdoor

#include "inc_chat"
#include "inc_discord"
#include "nw_i0_tool"
#include "x3_inc_string"

void main()
{
     //get the pc who used the trapdoor
    object oPC = GetPCSpeaker();

    if (!HasItem(oPC, "SoulStone"))
    {
        string sMessage = GetName(oPC) + " has been booted for attempting to exploit teleporter.";
        ModMiscWebhook(sMessage);

        BootPC(oPC, "Booted for attempting to exploit teleporter.");

        sMessage = StringToRGBString(GetName(oPC), "777") + " has been booted for attempting to exploit teleporter.";
        SendMessageToGM(sMessage);
        return;
    }

    //get the target waypoint destination
    AssignCommand(oPC, TakeGoldFromCreature(GetHitDice(oPC) * 100, oPC, TRUE));
    SendMessageToPC(oPC, "Some of your gold was turned to lead during the teleport!");
    //jump the PC to the destination
    AssignCommand(oPC, JumpToObject(GetWaypointByTag("altar2")));

    object oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "SoulStone");
    if (GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
