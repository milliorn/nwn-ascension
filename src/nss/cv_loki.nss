//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/13/2002 12:14:41 PM
//:://////////////////////////////////////////////
//trapdoor_yes script by Kerico 7/7/02
//jumps the using PC to target waypoint and closes the trapdoor for next use
//place in action taken scipt in trapdoor conversation
//in 'yes' end dialog of the trapdoor

#include "nw_i0_tool"
#include "inc_discord"
#include "x3_inc_string"

void main()
{

    //get the pc who used the trapdoor
    object oPC = GetPCSpeaker();

    if (!HasItem(oPC, "lokikey"))
    {
        string sMessage = StringToRGBString(GetName(oPC), "777")
        + " has been invalidated and booted for attempting to exploit teleporter.";

        BootPC(oPC, "You have been booted for attempting to exploit teleporter.");
        SendMessageToAllDMs(sMessage);

        sMessage = GetName(oPC)
        + " has been booted for attempting to exploit teleporter.";
        ModMiscWebhook(sMessage);
    }
    //jump the PC to the destination
    AssignCommand(oPC, JumpToObject(GetWaypointByTag("lokistartpoint")));

    object oItemToTake = GetItemPossessedBy(oPC, "lokikey");
    if (GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
