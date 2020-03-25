#include "nwnx_time"
#include "nwnx_util"
#include "nwnx_webhook_rch"
#include "nwnx_player"

int PlayersOnline()
{
    int iPCTot = 0;

    object oPlayer = GetFirstPC();
    while (oPlayer != OBJECT_INVALID)
    {
        iPCTot++;
        oPlayer = GetNextPC();
    }

    return iPCTot;
}

void LoginWebhook(object oPC)
{
    string sConstructedMsg;
    string sName = GetName(oPC);
    struct NWNX_WebHook_Message stMessage;

    stMessage.sUsername = "Legends of Ascension";
    stMessage.sTitle = "LOGIN";
    stMessage.sColor = "#14aed3";
    stMessage.sAuthorName = sName;
    stMessage.sAuthorIconURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "t.png";
    stMessage.sThumbnailURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "m.png";
    stMessage.sDescription = "**" + sName + "** has logged in!";

    stMessage.sField1Name = "PLAYERS";
    stMessage.sField1Value = IntToString(PlayersOnline());
    stMessage.iField1Inline = TRUE;

    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();

    stMessage.sField2Name = "IP";
    stMessage.sField2Value = GetPCIPAddress(oPC);
    stMessage.iField2Inline = TRUE;

    stMessage.sField3Name = "CD";
    stMessage.sField3Value = GetPCPublicCDKey(oPC);
    stMessage.iField3Inline = TRUE;

    stMessage.sField4Name = "ACCOUNT";
    stMessage.sField4Value = GetPCPlayerName(oPC);
    stMessage.iField4Inline = TRUE;

    stMessage.sField5Name = "BIC";
    stMessage.sField5Value = NWNX_Player_GetBicFileName(oPC);
    stMessage.iField5Inline = TRUE;

    stMessage.sField6Name = "LEVEL";
    stMessage.sField6Value = IntToString(GetHitDice(oPC));
    stMessage.iField6Inline = TRUE;

    // public webhook
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), sConstructedMsg);
}

void LogoutWebhook(object oPC)
{
    string sConstructedMsg;
    string sName = GetName(oPC);
    struct NWNX_WebHook_Message stMessage;

    stMessage.sUsername = "Legends of Ascension";
    stMessage.sTitle = "LOGOUT";
    stMessage.sColor = "#14aed3";
    stMessage.sAuthorName = sName;
    stMessage.sAuthorIconURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "t.png";
    stMessage.sThumbnailURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "m.png";
    stMessage.sDescription = "**" + sName + "** has logged out!";

    stMessage.sField1Name = "PLAYERS";
    stMessage.sField1Value = IntToString(PlayersOnline() - 1);
    stMessage.iField1Inline = TRUE;

    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();

    stMessage.sField2Name = "IP";
    stMessage.sField2Value = GetPCIPAddress(oPC);
    stMessage.iField2Inline = TRUE;

    stMessage.sField3Name = "CD";
    stMessage.sField3Value = GetPCPublicCDKey(oPC);
    stMessage.iField3Inline = TRUE;

    stMessage.sField4Name = "ACCOUNT";
    stMessage.sField4Value = GetPCPlayerName(oPC);
    stMessage.iField4Inline = TRUE;

    stMessage.sField5Name = "BIC";
    stMessage.sField5Value = NWNX_Player_GetBicFileName(oPC);
    stMessage.iField5Inline = TRUE;

    stMessage.sField6Name = "LEVEL";
    stMessage.sField6Value = IntToString(GetHitDice(oPC));
    stMessage.iField6Inline = TRUE;

    // public webhook
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), sConstructedMsg);
}

void ModWebhook(string sMessage)
{
    string sConstructedMsg;
    struct NWNX_WebHook_Message stMessage;
    stMessage.sUsername = "Legends of Ascension";
    stMessage.sColor = "#bc8812";
    stMessage.sDescription = sMessage;
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), sConstructedMsg);
}

void ModChatWebhook(string sMessage)
{
    string sConstructedMsg;
    struct NWNX_WebHook_Message stMessage;
    stMessage.sUsername = "Legends of Ascension";
    stMessage.sColor = "#bc8812";
    stMessage.sDescription = sMessage;
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_CHAT_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_CHAT_CHANNEL"), sConstructedMsg);
}

void ModMiscWebhook(string sMessage)
{
    string sConstructedMsg;
    struct NWNX_WebHook_Message stMessage;
    stMessage.sUsername = "Legends of Ascension";
    stMessage.sColor = "#bc8812";
    stMessage.sDescription = sMessage;
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), sConstructedMsg);
}

void ModLoadWebhook()
{
    string sConstructedMsg;
    struct NWNX_WebHook_Message stMessage;
    stMessage.sUsername = "Legends of Ascension";
    stMessage.sColor = "#bc8812";
    stMessage.sDescription = "Legends of Ascension is online!";
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), sConstructedMsg);
}

void ModDownWebhook()
{
    string sConstructedMsg;
    struct NWNX_WebHook_Message stMessage;
    stMessage.sUsername = "Legends of Ascension";
    stMessage.sColor = "#bc8812";
    stMessage.sDescription = "Legends of Ascension server restart has begun";
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_PUBLIC_CHANNEL"), sConstructedMsg);
}

void CheatMaxStatsWebhook(object oPC, string sMessage)
{
    string sConstructedMsg;
    string sName = GetName(oPC);
    struct NWNX_WebHook_Message stMessage;

    stMessage.sUsername = "Legends of Ascension";
    stMessage.sTitle = "ALERT";
    stMessage.sColor = "#14aed3";
    stMessage.sAuthorName = sName;
    stMessage.sAuthorIconURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "t.png";
    stMessage.sThumbnailURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "m.png";
    stMessage.sDescription = "**" + sName + "** has " + sMessage;
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();

    stMessage.sField1Name = "CHA";
    stMessage.sField1Value = IntToString(GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE));
    stMessage.iField1Inline = TRUE;

    stMessage.sField2Name = "CON";
    stMessage.sField2Value = IntToString(GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE));
    stMessage.iField2Inline = TRUE;

    stMessage.sField3Name = "DEX";
    stMessage.sField3Value = IntToString(GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE));
    stMessage.iField3Inline = TRUE;

    stMessage.sField4Name = "INT";
    stMessage.sField4Value = IntToString(GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE));
    stMessage.iField4Inline = TRUE;

    stMessage.sField5Name = "STR";
    stMessage.sField5Value = IntToString(GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE));
    stMessage.iField5Inline = TRUE;

    stMessage.sField6Name = "WIS";
    stMessage.sField6Value = IntToString(GetAbilityScore(oPC, ABILITY_WISDOM, TRUE));
    stMessage.iField6Inline = TRUE;

    // public webhook
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), sConstructedMsg);
}

void CheatCreationStatsWebhook(object oPC, string sMessage)
{
    string sConstructedMsg;
    string sName = GetName(oPC);
    struct NWNX_WebHook_Message stMessage;

    stMessage.sUsername = "Legends of Ascension";
    stMessage.sTitle = "ALERT";
    stMessage.sColor = "#14aed3";
    stMessage.sAuthorName = sName;
    stMessage.sAuthorIconURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "t.png";
    stMessage.sThumbnailURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "m.png";
    stMessage.sDescription = "**" + sName + "** has " + sMessage;
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();

    stMessage.sField1Name = "Feat Count";
    stMessage.sField1Value = IntToString(GetLocalInt(oPC, "GetHasValidFeatCount"));
    stMessage.iField1Inline = TRUE;

    stMessage.sField2Name = "Feat Invalid";
    stMessage.sField2Value = GetLocalString(oPC, "GetHasInvalidFeats");
    stMessage.iField2Inline = TRUE;

    stMessage.sField3Name = "Abililty Score";
    stMessage.sField3Value = IntToString(GetAbilityScore(oPC, ABILITY_CHARISMA) +
                                         GetAbilityScore(oPC, ABILITY_CONSTITUTION) + GetAbilityScore(oPC, ABILITY_DEXTERITY) +
                                         GetAbilityScore(oPC, ABILITY_INTELLIGENCE) + GetAbilityScore(oPC, ABILITY_STRENGTH) + GetAbilityScore(oPC, ABILITY_WISDOM));
    stMessage.iField3Inline = TRUE;

    stMessage.sField4Name = "Hitpoints";
    stMessage.sField4Value = IntToString(GetMaxHitPoints(oPC));
    stMessage.iField4Inline = TRUE;

    stMessage.sField5Name = "Skill Points";
    stMessage.sField5Value = GetLocalString(oPC, "GetHasLegalSkillPoints");
    stMessage.iField5Inline = TRUE;

    stMessage.sField6Name = "AC";
    stMessage.sField6Value = IntToString(GetAC(oPC));
    stMessage.iField6Inline = TRUE;

    // public webhook
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), sConstructedMsg);
}

void PickpocketWebhook(object oPC, object oFrom, object oItem, string sArea)
{
    string sConstructedMsg;
    struct NWNX_WebHook_Message stMessage;
    //string sPlayerName = GetName(oPC);

    stMessage.sUsername = "Legends of Ascension";
    stMessage.sTitle = "ALERT";
    stMessage.sColor = "#14aed3";
    stMessage.sAuthorIconURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "t.png";
    stMessage.sThumbnailURL = "https://nwn.sfo2.digitaloceanspaces.com/portrait/" + GetStringLowerCase(GetPortraitResRef(oPC)) + "m.png";
    stMessage.sDescription = "Pickpocket Alert!";
    stMessage.sFooterText = GetName(GetModule());
    stMessage.iTimestamp = NWNX_Time_GetTimeStamp();

    stMessage.sField1Name = "Thief";
    stMessage.sField1Value = GetName(oPC);
    stMessage.iField1Inline = TRUE;

    stMessage.sField2Name = "Victim";
    stMessage.sField2Value = GetName(oFrom);
    stMessage.iField2Inline = TRUE;

    stMessage.sField3Name = "Item";
    stMessage.sField3Value = GetName(oItem);
    stMessage.iField3Inline = TRUE;

    stMessage.sField4Name = "Area";
    stMessage.sField4Value = sArea;
    stMessage.iField4Inline = TRUE;

    // public webhook
    sConstructedMsg = NWNX_WebHook_BuildMessageForWebHook("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), stMessage);
    NWNX_WebHook_SendWebHookHTTPS("discordapp.com", NWNX_Util_GetEnvironmentVariable("NWNX_WEBHOOK_ADMIN_CHANNEL"), sConstructedMsg);
}

//void main () {}
