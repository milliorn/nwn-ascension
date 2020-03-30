//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 27, 2020
//::
//:://////////////////////////////////////////////
#include "inc_chat"


void main()
{
    if (NWNX_Chat_GetChannel() == 5)
        return;
    if (GetIsPlayer() == FALSE)
        return;
    if (NWNX_Chat_GetSender() == OBJECT_INVALID)
        return;

    object oSender = NWNX_Chat_GetSender();
    object oTarget =NWNX_Chat_GetTarget();

    string sChannel;
    string sChat;
    string sNameSender = GetName(oSender);
    string sNameReceiver = GetName(oTarget);
    string sMessage = NWNX_Chat_GetMessage();

    int iChannel = NWNX_Chat_GetChannel();

    switch (iChannel)
    {
        case 1:
            sChannel = "PC-Talk";
            break;
        case 2:
            sChannel = "PC-Shout";
            break;
        case 3:
            sChannel = "PC-Whisper";
            break;
        case 4:
            sChannel = "PC-Tell";
            break;
        case 5:
            sChannel = "Server-Message";
            break;
        case 6:
            sChannel = "PC-Party";
            break;
        case 14:
            sChannel = "PC-DM";
            break;
        case 17:
            sChannel = "DM-Talk";
            break;
        case 18:
            sChannel = "DM-Shout";
            break;
        case 19:
            sChannel = "DM-Whisper";
            break;
        case 20:
            sChannel = "DM-Tell";
            break;
        case 22:
            sChannel = "DM-Party";
            break;
        case 30:
            sChannel = "DM-DM";
            break;
        default:
            NWNX_Chat_SkipMessage();
            break;
    }

    //  Auto Follow command
    if (sMessage == "!follow" && iChannel == 4)
    {
        AutoFollow(oTarget, oSender);
        return;
    }

    if (iChannel == 4 && GetIsGM(oSender))
    {
        if (sMessage == "!dm_info")
        {
            DMInfo(oTarget, oSender);
            return;
        }

        //  DM Sent target to jail command
        if (sMessage == "!dm_send_jail")
        {
            SendToJail(oTarget, oSender);
            return;
        }

        //  DM Sent target to hell command
        if (sMessage == "!dm_send_hell")
        {
            SendToHell(oTarget, oSender);
            return;
        }
        //  DM Sent target to hell command
        if (sMessage == "!dm_send_hell")
        {
            DMPunsh(oTarget, oSender);
            return;
        }

        //  DM Jump target to DM command
        if (sMessage == "!dm_jump_here")
        {
            AssignCommand(oTarget, ActionJumpToLocation(GetLocation(oSender)));
            return;
        }
        //  DM Jump DM to target command
        if (sMessage == "!dm_jump_there")
        {
            AssignCommand(oSender, ActionJumpToLocation(GetLocation(oTarget)));
            return;
        }

        //  DM Reveal Map command
        if (sMessage == "!dm_map")
        {
            ExploreAreaForPlayer(GetArea(oSender), oTarget);
            return;
        }

        if (sMessage == "!dm_inv_show")
        {
            ShowInventory(oTarget);
        }

        if (sMessage == "!dm_inv_take")
        {
            TakeInventory(oTarget, oSender);
        }

        //  Temp ban the target from shout until reset
        if (sMessage == "!dm_shout_ban")
        {
            ShoutBanTemp(oTarget, oSender);
            ModChatWebhook(GetName(oTarget) + " shout banned until reset by " + GetName(oSender));
            return;
        }
    }

    if (iChannel == 4 || iChannel == 20)
    {
        sChat = "(SENDER) - " + sNameSender +
                " (RECEIVER) - " + sNameReceiver +
                " (CHANNEL) - " + sChannel +
                " (TIME) - " + NWNX_Time_GetSystemTime() +
                " (MESSAGE) - " + sMessage;
    }
    else
    {
        sChat = "(SENDER) - " + sNameSender +
                " (CHANNEL) - " + sChannel +
                " (TIME) - " + NWNX_Time_GetSystemTime() +
                " (MESSAGE) - " + sMessage;
    }

    ModChatWebhook(sChat);

    if (iChannel == 4 || iChannel == 20)
    {
        sChat = StringToRGBString("SENDER: ", "070") + sNameSender +
                StringToRGBString("RECEIVER: ", "070") + sNameReceiver +
                StringToRGBString("CHANNEL: ", "070") + sChannel +
                StringToRGBString("MESSAGE: ", "070") + sMessage;
    }
    else
    {
        sChat = StringToRGBString("SENDER: ", "070") + sNameSender +
                StringToRGBString("CHANNEL: ", "070") + sChannel +
                StringToRGBString("MESSAGE: ", "070") + sMessage;
    }

    SendMessageToGM(sChat);
}
