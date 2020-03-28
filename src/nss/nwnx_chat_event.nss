//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 27, 2020
//::
//:://////////////////////////////////////////////
#include "inc_event_module"
#include "nwnx_chat"

//  Get if object is PC or DM
int GetIsPlayer();

int GetIsPlayer()
{
    /*if (GetIsPC(OBJECT_SELF) == TRUE || GetIsDM(OBJECT_SELF) == TRUE)
        return TRUE;
    else
        return FALSE;  */
    return GetIsPC(OBJECT_SELF) == TRUE || GetIsDM(OBJECT_SELF) == TRUE;
}

void main()
{
    if (NWNX_Chat_GetChannel() == 5)
        return;
    if (GetIsPlayer() == FALSE)
        return;
    if (NWNX_Chat_GetSender() == OBJECT_INVALID)
        return;

    string sChannel;
    string sChat;
    string sNameSender = GetName(NWNX_Chat_GetSender());
    string sNameReceiver = GetName(NWNX_Chat_GetTarget());
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

    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if (GetIsGM(oPC))
        {
            NWNX_Chat_SendMessage(5, sChat, OBJECT_SELF, oPC);
        }

        oPC = GetNextPC();
    }
}

