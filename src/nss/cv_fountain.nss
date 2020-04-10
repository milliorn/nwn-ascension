//trapdoor_yes script by Kerico 7/7/02
//jumps the using PC to target waypoint and closes the trapdoor for next use
//place in action taken scipt in trapdoor conversation
//in 'yes' end dialog of the trapdoor
#include "inc_discord"
#include "inc_chat"
#include "nw_i0_tool"
#include "x3_inc_string"
void main()
{
    object oPC = GetPCSpeaker();
    string name1 = GetPCPlayerName(oPC);

    if (!HasItem(oPC, "rainbowstone"))
    {
        string sMessage = StringToRGBString(GetName(oPC), "777")
        + " has been invalidated and booted for attempting to exploit teleporter.";

        BootPC(oPC, "You have been booted for attempting to exploit teleporter.");
        SendMessageToGM(sMessage);

        sMessage = GetName(oPC)
        + " has been booted for attempting to exploit teleporter.";
        ModMiscWebhook(sMessage);
    }

    //jump the PC to the destination
    AssignCommand(oPC, JumpToObject(GetWaypointByTag("rainbow2")));
    object oItemToTake = GetItemPossessedBy(GetPCSpeaker(), "rainbowstone");
    if (GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
