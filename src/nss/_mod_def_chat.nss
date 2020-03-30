//:://////////////////////////////////////////////
//:: By: Scott Milliorn
//:: Created On: 26th August 2008
//:: Updated On: 3rd October 2018
//:://////////////////////////////////////////////
#include "inc_chat"

void main()
{
    object oPC = GetPCChatSpeaker();

    //  If we are not a PC or DM then we stop here
    if (!GetIsPC(oPC) && !GetIsDM(oPC)) return;

    string sName = GetName(oPC, TRUE),
           sAccount = GetPCPlayerName(oPC),
           sCDKEY = GetPCPublicCDKey(oPC, TRUE),
           sPCLevel = IntToString(GetHitDice(oPC)),
           sText = GetStringUpperCase(GetPCChatMessage()),
           sLower = GetStringLowerCase(GetPCChatMessage()),
           sMsg = GetPCChatMessage();

    switch (GetPCChatVolume())
    {
        // we only process shout from here, other chat are hooked in the events_chat script
        case TALKVOLUME_SHOUT:
        {
            // if the player used shout, but shouldn't be allowed to, disable shout and set talk channel
            if (GetIsShoutBanned(oPC))
            {
                // the player is banned from shout, process their shout through the talk channel
                SetPCChatMessage("");
                SendMessageToPC(oPC, "You are shout banned until server restart");
                // tell the player they cannot shout until server reset, or until a dm removes the shout ban
                //FloatingTextStringOnCreature (MSG_SHOUT_BANNED_1, oPC);
                return;
            }
            // no break needed, we don't want to exit the switch, but continue to default
        default:
        }
    }

    int iSpam = GetLocalInt(oPC, "PC_CHAT");

    DelayCommand(0.6, DeleteLocalInt(oPC, "PC_CHAT"));

    if (GetLocalInt(oPC, "PC_CHAT") > 0)
    {
        StopSpam(oPC, sName, sAccount, sCDKEY, iSpam);
        return;
    }

    SetLocalInt(oPC, "PC_CHAT", 1);

    if (GetLocalInt(oPC, "PORTRAIT"))
    {
        string sPortrait = GetPCChatMessage();
        int iPortrait = StringToInt(sPortrait);
        SetPortraitId(oPC, iPortrait);
        DeleteLocalInt(oPC, "PORTRAIT");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Portrait changed");
        return;
    }

    else if (GetLocalInt(oPC, "VOICE"))
    {
        string sVoice = GetPCChatMessage();
        int iVoice = StringToInt(sVoice);
        NWNX_Creature_SetSoundset(oPC, iVoice);
        DeleteLocalInt(oPC, "VOICE");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Voice changed");
        return;
    }

    else if (GetLocalInt(oPC, "SKIN"))
    {
        string sSkin = GetPCChatMessage();
        int iSkin = StringToInt(sSkin);
        SetColor(oPC, COLOR_CHANNEL_SKIN, iSkin);
        DeleteLocalInt(oPC, "SKIN");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Skin changed");
        return;
    }

    else if (GetLocalInt(oPC, "HAIR"))
    {
        string sHair = GetPCChatMessage();
        int iHair = StringToInt(sHair);
        SetColor(oPC, COLOR_CHANNEL_HAIR, iHair);
        DeleteLocalInt(oPC, "HAIR");
        SetPCChatMessage("");
        SendMessageToPC(oPC, "Hair changed");
        return;
    }

    if (GetStringLeft(sMsg, 3) == "!dm")
    {
        if (!GetIsGM(oPC)) return;
        ChatDMTools(oPC, sText, sName);
        return;
    }

    // get the code (if any)
    string sCode = GetStringLeft (sMsg, 1);
    // remove the ! code from the string
    sMsg = GetStringRight (sMsg, GetStringLength(sMsg) - 1);
    // emote processes with '*'
    if (sCode == "*")
    {
        ChatEmote(oPC, sMsg);
        return;
    }
    else if (sCode == "!")
    {
        ChatCommand(oPC, sMsg, sName, sPCLevel);
        return;
    }
}
