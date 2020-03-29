//:://////////////////////////////////////////////
//:: Created By: Scarface
//:: Modified By: Milliorn
//:: Created On: 26th August 2008
//:: Modified On: 3rd October 2018
//:://////////////////////////////////////////////

// Experience Requirements for Legendary Levels
const int BASE_XP_LVL_40 = 780000; //
const int XP_REQ_LVL41 = 1560000;  //
const int XP_REQ_LVL42 = 2340000;  //
const int XP_REQ_LVL43 = 3120000;  //
const int XP_REQ_LVL44 = 3900000;  //
const int XP_REQ_LVL45 = 4680000;  //
const int XP_REQ_LVL46 = 5460000;  //
const int XP_REQ_LVL47 = 6240000;  //
const int XP_REQ_LVL48 = 7020000;  //
const int XP_REQ_LVL49 = 7800000;  //
const int XP_REQ_LVL50 = 8580000;  //
const int XP_REQ_LVL51 = 9360000;  //
const int XP_REQ_LVL52 = 10140000; //
const int XP_REQ_LVL53 = 10920000; //
const int XP_REQ_LVL54 = 11700000; //
const int XP_REQ_LVL55 = 12480000; //
const int XP_REQ_LVL56 = 13260000; //
const int XP_REQ_LVL57 = 14040000; //
const int XP_REQ_LVL58 = 14820000; //
const int XP_REQ_LVL59 = 15600000; //
const int XP_REQ_LVL60 = 16380000; //

#include "nwnx_creature"
#include "inc_chat_emotes"
#include "inc_chat_list"
#include "inc_event_module"
#include "x2_inc_itemprop"
#include "x3_inc_string"

//  Check if we are shout banned
int GetIsShoutBanned(object oSender);

//  Stop PC from spamming chat
void StopSpam(object oPC, string sName, string sAccount, string sCDKEY, int iSpam);

//  DM Chat tools
void DmChatTools(object oPC, string sText, string sName);

// Created Arm - Bone
void ChatArmBone(object oPC);

// Created Arm - Normal
void ChatArmNormal(object oPC);

// Create Head - Next
void ChatHeadNext(object oPC);

// Create Head - Previous
void ChatHeadPrevious(object oPC);

//  Create Cyan Eyes
void ChatEyesCyan(object oPC);

//  Create Green Eyes
void ChatEyesGreen(object oPC);

// Remove Eye VFX
void ChatEyesNone(object oPC);

// Create Orange eyes
void ChatEyesOrange(object oPC);

// Create Purple eyes
void ChatEyesPurple(object oPC);

// Create Red Flame Eyes
void ChatEyesRed(object oPC);

// Create White Eyes
void ChatEyesWhite(object oPC);

// Create Yellow Eyes
void ChatEyesYellow(object oPC);

//  Apply vfx to weapon
void ApplyWeaponEffects(object oPC, int nEffect);

//  Re-equip all items
void ChatReEquipItem(object oPC);

//  Execute emote chat command
void ChatEmote(object oPC, string sMsg);

//  Execute chat commands
void ChatCommand(object oPC, string sMsg, string sName, string sPCLevel);

int GetIsShoutBanned(object oSender)
{
    if (GetLocalInt(GetModule(), "shout_disabled"))
    {
        return TRUE;
    }

    else
        return FALSE;
}

void ChatArmBone(object oPC)
{
    SetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, CREATURE_MODEL_TYPE_UNDEAD, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, CREATURE_MODEL_TYPE_UNDEAD, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_HAND, CREATURE_MODEL_TYPE_UNDEAD, oPC);
}

void ChatArmNormal(object oPC)
{
    SetCreatureBodyPart(CREATURE_PART_LEFT_BICEP, CREATURE_MODEL_TYPE_SKIN, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_FOREARM, CREATURE_MODEL_TYPE_SKIN, oPC);
    SetCreatureBodyPart(CREATURE_PART_LEFT_HAND, CREATURE_MODEL_TYPE_SKIN, oPC);
}

void ChatHeadNext(object oPC)
{
    int iPartNum = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC) + 1;
    if (iPartNum > 34)
        iPartNum = 1;
    SetCreatureBodyPart(CREATURE_PART_HEAD, iPartNum, oPC);
}

void ChatHeadPrevious(object oPC)
{
    int iPartNum = GetCreatureBodyPart(CREATURE_PART_HEAD, oPC) - 1;
    if (iPartNum < 1)
        iPartNum = 34;
    SetCreatureBodyPart(CREATURE_PART_HEAD, iPartNum, oPC);
}

void ChatEyesCyan(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch (GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_DWARF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_ELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_GNOME_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_TROGLODYTE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_CYN_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ChatEyesGreen(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch (GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_DWARF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_ELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_GNOME_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_GREEN_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ChatEyesNone(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);
    int iType, iSub;

    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
}

void ChatEyesOrange(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch (GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_DWARF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_ELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_GNOME_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_TROGLODYTE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFLING_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFORC_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HUMAN_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_ORG_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ChatEyesPurple(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch (GetRacialType(oPC))
        {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_DWARF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_ELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_GNOME_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_TROGLODYTE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFLING_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFORC_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HUMAN_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_PUR_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ChatEyesRed(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch (GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_DWARF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_ELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_GNOME_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFLING_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFORC_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_RED_FLAME_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ChatEyesWhite(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch (GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_DWARF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_ELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_GNOME_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_TROGLODYTE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFLING_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFORC_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HUMAN_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_WHT_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ChatEyesYellow(object oPC)
{
    effect eEffect, eVisEyes;
    int iGender = GetGender(oPC), iSub, iType;

    switch (GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_DWARF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_DWARF_FEMALE);
            break;
        }
        case RACIAL_TYPE_ELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_ELF_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_ELF_FEMALE);
            break;
        }
        case RACIAL_TYPE_GNOME:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_GNOME_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_GNOME_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFELF:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_TROGLODYTE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_TROGLODYTE);
            break;
        }
        case RACIAL_TYPE_HALFLING:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFLING_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFLING_FEMALE);
            break;
        }
        case RACIAL_TYPE_HALFORC:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFORC_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HALFORC_FEMALE);
            break;
        }
        case RACIAL_TYPE_HUMAN:
        {
            if (iGender == GENDER_MALE)
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HUMAN_MALE);
            else
                eVisEyes = EffectVisualEffect(VFX_EYES_YEL_HUMAN_FEMALE);
            break;
        }
    }
    eEffect = GetFirstEffect(oPC);
    while (GetIsEffectValid(eEffect))
    {
        iType = GetEffectType(eEffect);
        iSub = GetEffectSubType(eEffect);
        if (iType == EFFECT_TYPE_VISUALEFFECT && iSub == SUBTYPE_SUPERNATURAL)
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(eVisEyes), oPC);
}

void ApplyWeaponEffects(object oPC, int nEffect)
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    if (GetIsObjectValid(oItem))
    {
        IPRemoveMatchingItemProperties(oItem, ITEM_PROPERTY_VISUALEFFECT, -1);
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyVisualEffect(nEffect), oItem);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SUPER_HEROISM), oPC);
    }
}

void ChatReEquipItem(object oPC)
{
    object oArms = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC),
           oBelt = GetItemInSlot(INVENTORY_SLOT_BELT, oPC),
           oBoots = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC),
           oChest = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC),
           oCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC),
           oHead = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC),
           oLeftH = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC),
           oLeftR = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC),
           oNeck = GetItemInSlot(INVENTORY_SLOT_NECK, oPC),
           oRightH = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC),
           oRightR = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

    if (GetIsObjectValid(oArms))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oArms));
        AssignCommand(oPC, ActionEquipItem(oArms, INVENTORY_SLOT_ARMS));
    }

    if (GetIsObjectValid(oBelt))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oBelt));
        DelayCommand(0.1, AssignCommand(oPC, ActionEquipItem(oBelt, INVENTORY_SLOT_BELT)));
    }
    if (GetIsObjectValid(oBoots))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oBoots));
        DelayCommand(0.2, AssignCommand(oPC, ActionEquipItem(oBoots, INVENTORY_SLOT_BOOTS)));
    }
    if (GetIsObjectValid(oChest))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oChest));
        DelayCommand(0.3, AssignCommand(oPC, ActionEquipItem(oChest, INVENTORY_SLOT_CHEST)));
    }
    if (GetIsObjectValid(oCloak))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oCloak));
        DelayCommand(0.4, AssignCommand(oPC, ActionEquipItem(oCloak, INVENTORY_SLOT_CLOAK)));
    }
    if (GetIsObjectValid(oHead))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oHead));
        DelayCommand(0.5, AssignCommand(oPC, ActionEquipItem(oHead, INVENTORY_SLOT_HEAD)));
    }
    if (GetIsObjectValid(oLeftH))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oLeftH));
        DelayCommand(0.6, AssignCommand(oPC, ActionEquipItem(oLeftH, INVENTORY_SLOT_LEFTHAND)));
    }
    if (GetIsObjectValid(oLeftR))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oLeftR));
        DelayCommand(0.7, AssignCommand(oPC, ActionEquipItem(oLeftR, INVENTORY_SLOT_LEFTRING)));
    }
    if (GetIsObjectValid(oNeck))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oNeck));
        DelayCommand(0.8, AssignCommand(oPC, ActionEquipItem(oNeck, INVENTORY_SLOT_NECK)));
    }
    if (GetIsObjectValid(oRightH))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oRightH));
        DelayCommand(0.9, AssignCommand(oPC, ActionEquipItem(oRightH, INVENTORY_SLOT_RIGHTHAND)));
    }
    if (GetIsObjectValid(oRightR))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionUnequipItem(oRightR));
        DelayCommand(1.0, AssignCommand(oPC, ActionEquipItem(oRightR, INVENTORY_SLOT_RIGHTRING)));
    }

    DelayCommand(1.1, FloatingTextStringOnCreature(StringToRGBString("All Items have been re-equipped.", STRING_COLOR_GREEN), oPC, FALSE));
    DelayCommand(1.2, ExportSingleCharacter(oPC));
    DelayCommand(1.3, FloatingTextStringOnCreature(StringToRGBString("Character Saved", STRING_COLOR_GREEN), oPC, FALSE));
    DelayCommand(1.4, ExecuteScript("ws_saveall_sub", oPC));
    return;
}

void ChatServer()
{
    object oUser = GetPCChatSpeaker();
    int iPCTot = 0, /* total PC's */
        iDM = 0,    // Anonymous DM's online
        iLvl = 0;   // Allows for Legendary Levels
    string sPCName,
        sPCLevel,
        sDM,
        sMessage;

    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        iPCTot++;
        sPCName = StringToRGBString(GetName(oPC), STRING_COLOR_RED) + " ";
        iLvl = GetHitDice(oPC);
        sPCLevel = StringToRGBString("Level: ", STRING_COLOR_WHITE) +
                   StringToRGBString(IntToString(iLvl), STRING_COLOR_BLUE) + " ";

        if (GetIsDM(oPC))
        {
            sDM = StringToRGBString("[DM] ", STRING_COLOR_BLACK);
        }

        else
        {
            sDM = "";
        }

        sMessage = sPCName + sPCLevel + sDM + " " + GetName(GetArea(oPC));
        SendMessageToPC(oUser, sMessage);

        if (GetIsDM(oPC))
            iDM++; // Count anonymous DM's online
        oPC = GetNextPC();
    }

    sMessage = IntToString(iPCTot) +
               StringToRGBString("players online!", STRING_COLOR_ROSE);
    SendMessageToPC(oUser, sMessage);
    return;
}

void ChatSaveCharacter(object oPC)
{
    SetPCChatMessage("");
    ExportSingleCharacter(oPC);
    FloatingTextStringOnCreature(StringToRGBString("Character Saved", STRING_COLOR_GREEN), oPC, FALSE);
    ExecuteScript("ws_saveall_sub", oPC);
    return;
}

void ChatRelevelPC(object oPC)
{
    int nXP = GetXP(oPC);
    int nHD = GetHitDice(oPC);
    SetXP(oPC, (((nHD * (nHD - 1)) / 2 * 1000) - 1));
    DelayCommand(1.0, SetXP(oPC, nXP));
    ExportSingleCharacter(oPC);
    FloatingTextStringOnCreature(StringToRGBString("Level re-roll activated.", STRING_COLOR_GREEN), oPC, FALSE);
    ExecuteScript("ws_saveall_sub", oPC);
}

void ChatRebuildPC(object oPC)
{
    int nXP = GetXP(oPC);
    SetXP(oPC, 0);
    DelayCommand(1.0, SetXP(oPC, nXP));
    ExportSingleCharacter(oPC);
    FloatingTextStringOnCreature(StringToRGBString("Rebuild all levels activated.", STRING_COLOR_GREEN), oPC, FALSE);
    ExecuteScript("ws_saveall_sub", oPC);
}

void ChatPvP(object oPC)
{
    object oRecall = GetItemPossessedBy(oPC, "itm_teleport");
    int nVictims = GetLocalInt(oRecall, "PVP_KILL"),
        nDeaths = GetLocalInt(oRecall, "PVP_DEATH"),
        nScore = (nVictims - nDeaths);
    string sVictims = IntToString(nVictims),
           sDeaths = IntToString(nDeaths),
           sScore = IntToString(nScore);

    if (nScore < 0)
        nScore = 0;

    FloatingTextStringOnCreature(StringToRGBString("PVP STATS!", STRING_COLOR_GREEN), oPC, FALSE);
    DelayCommand(1.0, FloatingTextStringOnCreature(StringToRGBString("VICTORIES: ", STRING_COLOR_BLUE) + sVictims, oPC, FALSE));
    DelayCommand(2.0, FloatingTextStringOnCreature(StringToRGBString("DEFEATS: ", STRING_COLOR_RED) + sDeaths, oPC, FALSE));
    DelayCommand(3.0, FloatingTextStringOnCreature(StringToRGBString("SCORE: ", STRING_COLOR_WHITE) + sScore, oPC, FALSE));
}

void ChatBounties(object oPC)
{
    object oPlayer = GetFirstPC(),
           oRecall;
    int iBounty;
    string sName = GetName(oPC);

    SetPCChatMessage("");
    FloatingTextStringOnCreature(StringToRGBString("Bounties:", STRING_COLOR_GREEN), oPC, FALSE);

    while (GetIsObjectValid(oPlayer))
    {
        oRecall = GetItemPossessedBy(oPlayer, "itm_teleport");
        iBounty = GetLocalInt(oRecall, "BOUNTY");

        if (iBounty >= 1)
        {
            FloatingTextStringOnCreature(StringToRGBString(GetName(oPlayer), STRING_COLOR_BLUE) +
                                             " - " + IntToString(iBounty) +
                                             StringToRGBString("PK's", STRING_COLOR_ROSE) +
                                             StringToRGBString(GetName(GetArea(oPlayer)), STRING_COLOR_GREEN),
                                         oPC, FALSE);
        }

        oPlayer = GetNextPC();
    }

    return;
}

void ChatLegend(object oPC)
{
    int idiff,
        ixp = GetXP(oPC),
        iLvl = GetHitDice(oPC);

    string smax;

    FloatingTextStringOnCreature("You are currently Level " + IntToString(iLvl), oPC, FALSE);

    if (iLvl == 60)
    {
        FloatingTextStringOnCreature("You are a Demi-God!", oPC, TRUE);
        return;
    }

    else if (iLvl < 40)
    {
        FloatingTextStringOnCreature("You are not eligible for Legendary Levels", oPC, FALSE);
        return;
    }

    if (ixp < XP_REQ_LVL60)
    {
        idiff = (XP_REQ_LVL60 - ixp);
        smax = "Level 60";
    }
    if (ixp < XP_REQ_LVL59)
    {
        idiff = (XP_REQ_LVL59 - ixp);
        smax = "Level 59";
    }
    if (ixp < XP_REQ_LVL58)
    {
        idiff = (XP_REQ_LVL58 - ixp);
        smax = "Level 58";
    }
    if (ixp < XP_REQ_LVL57)
    {
        idiff = (XP_REQ_LVL57 - ixp);
        smax = "Level 57";
    }
    if (ixp < XP_REQ_LVL56)
    {
        idiff = (XP_REQ_LVL56 - ixp);
        smax = "Level 56";
    }
    if (ixp < XP_REQ_LVL55)
    {
        idiff = (XP_REQ_LVL55 - ixp);
        smax = "Level 55";
    }
    if (ixp < XP_REQ_LVL54)
    {
        idiff = (XP_REQ_LVL54 - ixp);
        smax = "Level 54";
    }
    if (ixp < XP_REQ_LVL53)
    {
        idiff = (XP_REQ_LVL53 - ixp);
        smax = "Level 53";
    }
    if (ixp < XP_REQ_LVL52)
    {
        idiff = (XP_REQ_LVL52 - ixp);
        smax = "Level 52";
    }
    if (ixp < XP_REQ_LVL51)
    {
        idiff = (XP_REQ_LVL51 - ixp);
        smax = "Level 51";
    }
    if (ixp < XP_REQ_LVL50)
    {
        idiff = (XP_REQ_LVL50 - ixp);
        smax = "Level 50";
    }
    if (ixp < XP_REQ_LVL49)
    {
        idiff = (XP_REQ_LVL49 - ixp);
        smax = "Level 49";
    }
    if (ixp < XP_REQ_LVL48)
    {
        idiff = (XP_REQ_LVL48 - ixp);
        smax = "Level 48";
    }
    if (ixp < XP_REQ_LVL47)
    {
        idiff = (XP_REQ_LVL47 - ixp);
        smax = "Level 47";
    }
    if (ixp < XP_REQ_LVL46)
    {
        idiff = (XP_REQ_LVL46 - ixp);
        smax = "Level 46";
    }
    if (ixp < XP_REQ_LVL45)
    {
        idiff = (XP_REQ_LVL45 - ixp);
        smax = "Level 45";
    }
    if (ixp < XP_REQ_LVL44)
    {
        idiff = (XP_REQ_LVL44 - ixp);
        smax = "Level 44";
    }
    if (ixp < XP_REQ_LVL43)
    {
        idiff = (XP_REQ_LVL43 - ixp);
        smax = "Level 43";
    }
    if (ixp < XP_REQ_LVL42)
    {
        idiff = (XP_REQ_LVL42 - ixp);
        smax = "Level 42";
    }
    if (ixp < XP_REQ_LVL41)
    {
        idiff = (XP_REQ_LVL41 - ixp);
        smax = "Level 41";
    }

    FloatingTextStringOnCreature("You need " + IntToString(idiff) + "xp for " + smax, oPC, FALSE);
}

void StopSpam(object oPC, string sName, string sAccount, string sCDKEY, int iSpam)
{
    if (GetLocalInt(oPC, "PC_CHAT") >= 2)
    {
        SetPCChatMessage("");
        AssignCommand(oPC, BootPC(oPC, "You have been kicked from the server for SPAMMING CHAT!"));
        SpeakString(sName + "has been booted for spamming chat.", TALKVOLUME_SHOUT);
        ModMiscWebhook("Player: " + sName +
                       " Account: " + sAccount + " ID: " + sCDKEY + " has been booted for spamming chat.");
    }

    if (GetLocalInt(oPC, "PC_CHAT") == 2)
    {
        SetPCChatMessage("");
        FloatingTextStringOnCreature("LAST CHANCE DO NOT SPAM CHAT!", oPC, FALSE);
        SetLocalInt(oPC, "PC_CHAT", iSpam + 1);
    }

    if (GetLocalInt(oPC, "PC_CHAT") == 1)
    {
        SetPCChatMessage("");
        FloatingTextStringOnCreature("Please do not spam chat!", oPC, FALSE);
        SetLocalInt(oPC, "PC_CHAT", iSpam + 1);
    }
}

void DmChatTools(object oPC, string sText, string sName)
{
    if (TestStringAgainstPattern(sText, "!dm_room"))
    {
        SetPCChatMessage("");
        DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("DM_ROOM")))));
        FloatingTextStringOnCreature("Porting to DM Room.", oPC, FALSE);
        return;
    }

    if (TestStringAgainstPattern(sText, "!dm_resetmod"))
    {
        SetPCChatMessage("");

        ModMiscWebhook(sName +
                       " has activated SERVER RESET!!!Account: " + GetPCPlayerName(oPC) + " CD Key: " + GetPCPublicCDKey(oPC) + " IP: " + GetPCIPAddress(oPC));

        SpeakString(sName +
                        " has activated SERVER RESET!!!Account: " + GetPCPlayerName(oPC) + " CD Key: " + GetPCPublicCDKey(oPC),
                    TALKVOLUME_SHOUT);

        ExportAllCharacters();
        ExecuteScript("ws_saveall_sub", OBJECT_SELF);
        ExecuteScript("_mod_shutdown", OBJECT_SELF);
    }

    if (TestStringAgainstPattern(sText, "!dm_plot"))
    {
        SetPCChatMessage("");

        if (GetPlotFlag(oPC) == FALSE)
        {
            SetPlotFlag(oPC, TRUE);
            SendMessageToPC(oPC, "Plot set to true.");
        }

        if (GetPlotFlag(oPC) == TRUE)
        {
            SetPlotFlag(oPC, FALSE);
            SendMessageToPC(oPC, "Plot set to false.");
        }
    }

    if (TestStringAgainstPattern(sText, "!dm_rez"))
    {
        SetPCChatMessage("");
        Raise(oPC);
        ForceRest(oPC);
        SendMessageToPC(oPC, "DM Resurrection.");
    }

    else if (TestStringAgainstPattern(sText, "!dm_gold"))
    {
        SetPCChatMessage("");
        GiveGoldToCreature(oPC, 1000000);
        SendMessageToPC(oPC, "1 Million GP.");
    }

    else if (TestStringAgainstPattern(sText, "!dm_60"))
    {
        SetPCChatMessage("");
        GiveXPToCreature(oPC, 17498600);
        SendMessageToPC(oPC, "Level 60.");
    }

    else if (TestStringAgainstPattern(sText, "!dm_givelevel"))
    {
        SetPCChatMessage("");
        int nHD = GetHitDice(oPC);
        int nTargetLevel = nHD + 1;

        if (nTargetLevel > 40)
            nTargetLevel = 40;
        int nTargetXP = ((nTargetLevel * (nTargetLevel - 1)) / 2 * 1000);

        SetXP(oPC, nTargetXP);
        SendMessageToPC(oPC, "Give Level.");
    }

    else if (TestStringAgainstPattern(sText, "!dm_takelevel"))
    {
        SetPCChatMessage("");
        int nHD = GetHitDice(oPC);
        int nTargetLevel = nHD - 1;

        if (nTargetLevel < 1)
            nTargetLevel = 1;
        int nTargetXP = ((nTargetLevel * (nTargetLevel - 1)) / 2 * 1000);

        SetXP(oPC, nTargetXP);

        if (GetXP(oPC) == 0)
            SetXP(oPC, 1);

        SendMessageToPC(oPC, "Take Level");
    }

    if (TestStringAgainstPattern(sText, "!dm_leader"))
    {
        object oLeader = GetFactionLeader(oPC);
        object oLeaderArea = GetArea(oLeader);
        object oArea = GetArea(OBJECT_SELF);
        location lTarget = GetLocation(oLeader);

        SetPCChatMessage("");

        if (oLeader == oPC)
        {
            FloatingTextStringOnCreature("You are the leader.", oPC);
        }

        else if (GetArea(oLeader) == OBJECT_INVALID || oLeader == OBJECT_INVALID)
        {
            FloatingTextStringOnCreature("Unable to port to leader." + " Try again in a few seconds", oPC, FALSE);
        }

        else
        {
            FloatingTextStringOnCreature("Porting to leader.", oPC);
            DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(lTarget)));
        }
    }
}

void ChatEmote(object oPC, string sMsg)
{
    // emote processes with '*'
    int iVictory = d3();
    int iMoan = d3();
    // emote codes         0  3  6  9  12 15 18 21 24 27 30 33 36 39 42
    switch (FindSubString("go du do si gr bo bi re sa da st ta ch no pu", sMsg))
    {
        case 0: // goodbye
            DoGoodbye(oPC);
            break;

        case 3: // duck
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_DODGE_DUCK);
            break;

        case 6: // dodge
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_DODGE_SIDE);
            break;

        case 9: // sip
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_DRINK);
            DoBelch(oPC);
            break;

        case 12: // greeting
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_GREETING);
            DoHello(oPC);
            break;

        case 15: // bored
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_PAUSE_BORED);
            PlayVoiceChat(VOICE_CHAT_BORED, oPC);
            break;

        case 18: // Bad Idea
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
            PlayVoiceChat(VOICE_CHAT_BADIDEA, oPC);
            break;

        case 21: // read
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_READ);
            break;

        case 24: // salute
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_SALUTE);
            break;

        case 27: // Dance
            DoShriek(oPC);
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_SPASM);
            break;

        case 30: // steal
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_STEAL);
            break;

        case 33: // taunt
            DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_TAUNT);
            PlayVoiceChat(VOICE_CHAT_TAUNT, oPC);
            break;

        case 36: // cheer
            PlayVoiceChat(VOICE_CHAT_CHEER, oPC);
            if (iVictory == 1)
                DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_VICTORY1);
            else if (iVictory == 2)
                DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_VICTORY2);
            else
                DoFireForgetAnimation(oPC, ANIMATION_FIREFORGET_VICTORY3);
            break;

        case 39: // No
            DoHeadShake(oPC);
            break;

        case 42: // Puke
            DoPuke(oPC);
            break;
    }
    // emote codes         0  3  6  9  12 15 18 21 24 27 30 33 36 39 42 45 48 51
    switch (FindSubString("co in fb ff lo bf li se me mo dr ti sq sc la be wo sp", sMsg))
    {
        case 0: // conjure
            DoLoopAnimation(oPC, ANIMATION_LOOPING_CONJURE1);
            break;

        case 3: // invoke
            DoLoopAnimation(oPC, ANIMATION_LOOPING_CONJURE2);
            break;

        case 6: // Fall Back
            DoLoopAnimation(oPC, ANIMATION_LOOPING_DEAD_BACK);
            PlayVoiceChat(VOICE_CHAT_DEATH, oPC);
            break;

        case 9: // Fall Front
            DoLoopAnimation(oPC, ANIMATION_LOOPING_DEAD_FRONT);
            PlayVoiceChat(VOICE_CHAT_NEARDEATH, oPC);
            break;

        case 12: // Lean Over
            DoLoopAnimation(oPC, ANIMATION_LOOPING_GET_LOW);
            break;

        case 15: // Bend Forward
            DoLoopAnimation(oPC, ANIMATION_LOOPING_GET_MID);
            break;

        case 18: // Listen
            DoLoopAnimation(oPC, ANIMATION_LOOPING_LISTEN);
            break;

        case 21: // Search
            DoLoopAnimation(oPC, ANIMATION_LOOPING_LOOK_FAR);
            PlayVoiceChat(VOICE_CHAT_LOOKHERE, oPC);
            break;

        case 24: // Meditate
            DoLoopAnimation(oPC, ANIMATION_LOOPING_MEDITATE);
            break;

        case 27: // Moan
            DoLoopAnimation(oPC, ANIMATION_LOOPING_PAUSE);
            //int iMoan = d3();
            if (iMoan == 1)
                PlayVoiceChat(VOICE_CHAT_PAIN1, oPC);
            else if (iMoan == 2)
                PlayVoiceChat(VOICE_CHAT_PAIN2, oPC);
            else
                PlayVoiceChat(VOICE_CHAT_PAIN3, oPC);
            break;

        case 30: // Drunk
            PlayVoiceChat(VOICE_CHAT_POISONED, oPC);
            DoLoopAnimation(oPC, ANIMATION_LOOPING_PAUSE_DRUNK);
            break;

        case 33: // Tired
            PlayVoiceChat(VOICE_CHAT_REST, oPC);
            DoLoopAnimation(oPC, ANIMATION_LOOPING_PAUSE_TIRED);
            break;

        case 36: // Squat
            DoLoopAnimation(oPC, ANIMATION_LOOPING_SIT_CHAIR);
            break;

        case 39: // Sit Cross
            DoLoopAnimation(oPC, ANIMATION_LOOPING_SIT_CROSS);
            PlayVoiceChat(VOICE_CHAT_TALKTOME, oPC);
            break;

        case 42: // Laugh
            DoLoopAnimation(oPC, ANIMATION_LOOPING_TALK_LAUGHING);
            PlayVoiceChat(VOICE_CHAT_LAUGH, oPC);
            break;

        case 45: // Beg
            DoLoopAnimation(oPC, ANIMATION_LOOPING_TALK_PLEADING);
            break;

        case 48: // Worship
            DoLoopAnimation(oPC, ANIMATION_LOOPING_WORSHIP);
            break;

        case 51: // Spasm
            DoLoopAnimation(oPC, ANIMATION_LOOPING_SPASM);
            break;
    }
}

void ChatCommand(object oPC, string sMsg, string sName, string sPCLevel)
{
    // weapon visual codes 0    5    10   15   20   25   30
    switch (FindSubString("wpev wpso wpac wpco wpho wpfi wpel", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            ApplyWeaponEffects(oPC, ITEM_VISUAL_EVIL);
            break;

        case 5:
            SetPCChatMessage("");
            ApplyWeaponEffects(oPC, ITEM_VISUAL_SONIC);
            break;

        case 10:
            SetPCChatMessage("");
            ApplyWeaponEffects(oPC, ITEM_VISUAL_ACID);
            break;

        case 15:
            SetPCChatMessage("");
            ApplyWeaponEffects(oPC, ITEM_VISUAL_COLD);
            break;

        case 20:
            SetPCChatMessage("");
            ApplyWeaponEffects(oPC, ITEM_VISUAL_HOLY);
            break;

        case 25:
            SetPCChatMessage("");
            ApplyWeaponEffects(oPC, ITEM_VISUAL_FIRE);
            break;

        case 30:
            SetPCChatMessage("");
            ApplyWeaponEffects(oPC, ITEM_VISUAL_ELECTRICAL);
            break;
    }
    // Player codes        0   4        13   18      26     33  37       46      54
    switch (FindSubString("lfg re_equip save relevel server pvp bounties rebuild legend", sMsg))
    {
        // Looking For Party
        case 0:
            SetPCChatMessage("");
            SpeakString("" + sName + " - Level: " + sPCLevel + " is looking for a party!", TALKVOLUME_SHOUT);
            break;

        // Re-Equip all equipped items
        case 4:
            SetPCChatMessage("");
            ChatReEquipItem(oPC);
            break;

        case 13:
            SetPCChatMessage("");
            ChatSaveCharacter(oPC);
            break;

        // Relevel Character
        case 18:
            SetPCChatMessage("");
            ChatRelevelPC(oPC);
            break;

        // Display all online players
        case 26:
            SetPCChatMessage("");
            ChatServer();
            break;

        // Display PvP stats
        case 33:
            SetPCChatMessage("");
            ChatPvP(oPC);
            break;

        case 37:
            SetPCChatMessage("");
            ChatBounties(oPC);
            break;

        case 46:
            SetPCChatMessage("");
            ChatRebuildPC(oPC);
            break;

        case 54:
            SetPCChatMessage("");
            ChatLegend(oPC);
            break;
    }
    // dice rolls          0    5
    switch (FindSubString("like dislike", sMsg))
    {
        case 0:
        {
            SetPCChatMessage("");
            SpeakString("" + sName + " status has been set to Neutral.", TALKVOLUME_SHOUT);
            // Loop all PC's in the module and set this PC to dislike them - uh oh
            object oDislike = GetFirstPC();
            while (GetIsObjectValid(oPC))
            {
                // Set to dislike
                SetPCLike(oPC, oDislike);
                // Get next PC
                oPC = GetNextPC();
            }
            //break;
        }
        break;
        case 5:
        {
            SetPCChatMessage("");
            SpeakString("" + sName +
                            " status has been set to Hostile.",
                        TALKVOLUME_SHOUT);
            // Loop all PC's in the module and set this PC to dislike them - uh oh
            object oDislike = GetFirstPC();
            while (GetIsObjectValid(oPC))
            {
                // Set to dislike
                SetPCDislike(oPC, oDislike);
                // Get next PC
                oPC = GetNextPC();
            }
            // break;
        }
        break;
    }

    // dice rolls          0   4    9   13 16  20 23 26 29
    switch (FindSubString("d10 d100 d12 d2 d20 d3 d4 d6 d8", sMsg))
    {
        case 0:
            SetPCChatMessage(sName + " d10 roll = " + IntToString(d10()));
            //SpeakString(sPCName+ " d10 roll = " + IntToString(d10()), TALKVOLUME_SHOUT);
            break;

        case 4:
            SetPCChatMessage(sName + " % roll = " + IntToString(d100()));
            //SpeakString(sPCName+ " % roll = " + IntToString(d100()), TALKVOLUME_SHOUT);
            break;

        case 9:
            SetPCChatMessage(sName + " d12 roll = " + IntToString(d12()));
            //SpeakString(sPCName+ " d12 roll = " + IntToString(d12()), TALKVOLUME_SHOUT);
            break;

        case 13:
            SetPCChatMessage(sName + " d2 roll = " + IntToString(d2()));
            //SpeakString(sPCName+ " d2 roll = " + IntToString(d2()), TALKVOLUME_SHOUT);
            break;

        case 16:
            SetPCChatMessage(sName + " d20 roll = " + IntToString(d20()));
            //SpeakString(sPCName+ " d20 roll = " + IntToString(d20()), TALKVOLUME_SHOUT);
            break;

        case 20:
            SetPCChatMessage(sName + " d3 roll = " + IntToString(d3()));
            //SpeakString(sPCName+ " d3 roll = " + IntToString(d3()), TALKVOLUME_SHOUT);
            break;

        case 23:
            SetPCChatMessage(sName + " d4 roll = " + IntToString(d4()));
            //SpeakString(sPCName+ " d4 roll = " + IntToString(d4()), TALKVOLUME_SHOUT);
            break;

        case 26:
            SetPCChatMessage(sName + " d6 roll = " + IntToString(d6()));
            //SpeakString(sPCName+ " d6 roll = " + IntToString(d6()), TALKVOLUME_SHOUT);
            break;

        case 29:
            SetPCChatMessage(sName + " d8 roll = " + IntToString(d8()));
            //SpeakString(sPCName+ " d8 roll = " + IntToString(d8()), TALKVOLUME_SHOUT);
            break;
    }
    // Change Alignments    0          11         22            36           49
    switch (FindSubString("align_good align_evil align_chaotic align_lawful align_neutral", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            AdjustAlignment(oPC, ALIGNMENT_GOOD, 100, FALSE);
            FloatingTextStringOnCreature("You shifted to a Good alignment.", oPC, FALSE);
            break;

        case 11:
            SetPCChatMessage("");
            AdjustAlignment(oPC, ALIGNMENT_EVIL, 100, FALSE);
            FloatingTextStringOnCreature("You shifted to an Evil alignment.", oPC, FALSE);
            break;

        case 22:
            SetPCChatMessage("");
            AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100, FALSE);
            FloatingTextStringOnCreature("You shifted to a Chaotic alignment.", oPC, FALSE);
            break;

        case 36:
            SetPCChatMessage("");
            AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100, FALSE);
            FloatingTextStringOnCreature("You shifted to a Lawful alignment.", oPC, FALSE);
            break;

        case 49:
            SetPCChatMessage("");
            AdjustAlignment(oPC, ALIGNMENT_NEUTRAL, 100, FALSE);
            FloatingTextStringOnCreature("You shifted to a Neutral alignment.", oPC, FALSE);
            break;
    }
    //                     0     6    12     18    24    30    36
    switch (FindSubString("w_ang w_bat w_bir w_but w_dem w_dra w_non", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            SetCreatureWingType(CREATURE_WING_TYPE_ANGEL, oPC);
            break;

        case 6:
            SetPCChatMessage("");
            SetCreatureWingType(CREATURE_WING_TYPE_BAT, oPC);
            break;

        case 12:
            SetPCChatMessage("");
            SetCreatureWingType(CREATURE_WING_TYPE_BIRD, oPC);
            break;

        case 18:
            SetPCChatMessage("");
            SetCreatureWingType(CREATURE_WING_TYPE_BUTTERFLY, oPC);
            break;

        case 24:
            SetPCChatMessage("");
            SetCreatureWingType(CREATURE_WING_TYPE_DEMON, oPC);
            break;

        case 30:
            SetPCChatMessage("");
            SetCreatureWingType(CREATURE_WING_TYPE_DRAGON, oPC);
            break;

        case 36:
            SetPCChatMessage("");
            SetCreatureWingType(CREATURE_WING_TYPE_NONE, oPC);
            break;
    }
    //                     0     6     12    18
    switch (FindSubString("t_bon t_dev t_liz t_non", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            SetCreatureTailType(CREATURE_TAIL_TYPE_BONE, oPC);
            break;

        case 6:
            SetPCChatMessage("");
            SetCreatureTailType(CREATURE_TAIL_TYPE_DEVIL, oPC);
            break;

        case 12:
            SetPCChatMessage("");
            SetCreatureTailType(CREATURE_TAIL_TYPE_LIZARD, oPC);
            break;

        case 18:
            SetPCChatMessage("");
            SetCreatureTailType(CREATURE_TAIL_TYPE_NONE, oPC);
            break;
    }
    //                     0      7    12     19   24        34    40    46   51    57
    switch (FindSubString("emotes wpnv player dice alignment wings tails eyes heads arms", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            ChatListEmotes(oPC);
            break;

        case 7:
            SetPCChatMessage("");
            ChatListWeapons(oPC);
            break;

        case 12:
            SetPCChatMessage("");
            ChatListPlayer(oPC);
            break;

        case 19:
            SetPCChatMessage("");
            ChatListDice(oPC);
            break;

        case 24:
            SetPCChatMessage("");
            ChatListAlignment(oPC);
            break;

        case 34:
            SetPCChatMessage("");
            ChatListWings(oPC);
            break;

        case 40:
            SetPCChatMessage("");
            ChatListTails(oPC);
            break;

        case 46:
            SetPCChatMessage("");
            ChatListEyes(oPC);
            break;

        case 51:
            SetPCChatMessage("");
            ChatListHead(oPC);
            break;

        case 57:
            SetPCChatMessage("");
            ChatListArm(oPC);
            break;
    }
    //   Eyes visual codes 0    5    10   15   20   25   30   35
    switch (FindSubString("eyec eyeg eyen eyeo eyep eyer eyew eyey", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            ChatEyesCyan(oPC);
            break;

        case 5:
            SetPCChatMessage("");
            ChatEyesGreen(oPC);
            break;

        case 10:
            SetPCChatMessage("");
            ChatEyesNone(oPC);
            break;

        case 15:
            SetPCChatMessage("");
            ChatEyesOrange(oPC);
            break;

        case 20:
            SetPCChatMessage("");
            ChatEyesPurple(oPC);
            break;

        case 25:
            SetPCChatMessage("");
            ChatEyesRed(oPC);
            break;

        case 30:
            SetPCChatMessage("");
            ChatEyesWhite(oPC);
            break;

        case 35:
            SetPCChatMessage("");
            ChatEyesYellow(oPC);
            break;
    }
    //                     0     6
    switch (FindSubString("headn headp", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            ChatHeadNext(oPC);
            break;

        case 6:
            SetPCChatMessage("");
            ChatHeadPrevious(oPC);
            break;
    }
    //                     0    5
    switch (FindSubString("armb armn", sMsg))
    {
        case 0:
            SetPCChatMessage("");
            ChatArmBone(oPC);
            break;

        case 5:
            SetPCChatMessage("");
            ChatArmNormal(oPC);
            break;
    }
    //                     0        9     15   20
    switch (FindSubString("portrait voice skin hair", sMsg))
    {
        case 0:
            if (!GetLocalInt(oPC, "PORTRAIT"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "PORTRAIT", 1);
                FloatingTextStringOnCreature("Type the number of the portrait " +
                                                 "found in the portraits.2da file and press Enter.",
                                             oPC, FALSE);
                break;
            }

        case 9:
            if (!GetLocalInt(oPC, "VOICE"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "VOICE", 1);
                FloatingTextStringOnCreature("Type the number of the soundset " +
                                                 "found in the soundset.2da file and press Enter.",
                                             oPC, FALSE);
                break;
            }

        case 15:
            if (!GetLocalInt(oPC, "SKIN"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "SKIN", 1);
                FloatingTextStringOnCreature("Type the number of the color " +
                                                 "0-175 and press Enter.",
                                             oPC, FALSE);
                break;
            }

        case 20:
            if (!GetLocalInt(oPC, "HAIR"))
            {
                SetPCChatMessage("");
                SetLocalInt(oPC, "HAIR", 1);
                FloatingTextStringOnCreature("Type the number of the color " +
                                                 "0-175 and press Enter.",
                                             oPC, FALSE);
                break;
        }
    }
}


//void main () {}
