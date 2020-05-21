//  Common Loot Generator Script
//  Created By: Scott Milliorn
//  Module - A Carpathian Nightmare
//  Date: June 13th, 2018

//  Additional help with donation of code from Dorrian of Trials of Newcastle

//  If any code is used from this script please give credit to both -
//  Milliorn of A Carpathian Nightmare
//  Dorrian of Trials of Newcastle

#include "x2_inc_itemprop"

//  Custom Code to generate common equippable loot and to randomize Item Properties
void GenerateRandomLoot();

void GenerateRandomLoot()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest,
           oItem,
           oCopy;

    int iRoll = d100();

    switch (iRoll)
    {
    case 1:
        oChest = GetObjectByTag("LOOT_AMMO_ARROWS");
        break;
    case 2:
        oChest = GetObjectByTag("LOOT_AMMO_BOLTS");
        break;
    case 3:
        oChest = GetObjectByTag("LOOT_AMMO_BULLETS");
        break;
    case 4:
        oChest = GetObjectByTag("LOOT_AMMO_CLOTHING");
        break;
    case 5:
        oChest = GetObjectByTag("LOOT_AMMO_HEAVY");
        break;
    case 6:
        oChest = GetObjectByTag("LOOT_AMMO_HELMET");
        break;
    case 7:
        oChest = GetObjectByTag("LOOT_ARMOR_LIGHT");
        break;
    case 8:
        oChest = GetObjectByTag("LOOT_ARMOR_MEDIUM");
        break;
    case 9:
        oChest = GetObjectByTag("LOOT_ARMOR_NPC_CLOTHING");
        break;
    case 10:
        oChest = GetObjectByTag("LOOT_AXES_GREAT");
        break;

    case 11:
        oChest = GetObjectByTag("LOOT_AXES_ONE");
        break;
    case 12:
        oChest = GetObjectByTag("LOOT_AXES_TWO");
        break;
    case 13:
        oChest = GetObjectByTag("LOOT_BLADED_BASTARD");
        break;
    case 14:
        oChest = GetObjectByTag("LOOT_BLADED_DAGGERS");
        break;
    case 15:
        oChest = GetObjectByTag("LOOT_BLADED_GREAT");
        break;
    case 16:
        oChest = GetObjectByTag("LOOT_BLADED_LONGSWORD");
        break;
    case 17:
        oChest = GetObjectByTag("LOOT_BLADED_OTHER");
        break;
    case 18:
        oChest = GetObjectByTag("LOOT_BLADED_SHORT");
        break;
    case 19:
        oChest = GetObjectByTag("LOOT_BLUNTS_CLUBS");
        break;
    case 20:
        oChest = GetObjectByTag("LOOT_BLUNTS_FLAILS");
        break;

    case 21:
        oChest = GetObjectByTag("LOOT_BLUNTS_HAMMERS");
        break;
    case 22:
        oChest = GetObjectByTag("LOOT_BLUNTS_MACES");
        break;
    case 23:
        oChest = GetObjectByTag("LOOT_BLUNTS_MORNINGSTARS");
        break;
    case 24:
        oChest = GetObjectByTag("LOOT_BOOKS");
        break;
    case 25:
        oChest = GetObjectByTag("LOOT_BOOTS");
        break;
    case 26:
        oChest = GetObjectByTag("LOOT_BRACERS");
        break;
    case 27:
        oChest = GetObjectByTag("LOOT_CLOAKS");
        break;
    case 28:
        oChest = GetObjectByTag("LOOT_DOUBLE_SIDED");
        break;
    case 29:
        oChest = GetObjectByTag("LOOT_EXOTIC");
        break;
    case 30:
        oChest = GetObjectByTag("LOOT_GAUNTLET");
        break;

    case 31:
        oChest = GetObjectByTag("LOOT_GEMS");
        break;
    case 32:
        oChest = GetObjectByTag("LOOT_JEWELRY_AMULET");
        break;
    case 33:
        oChest = GetObjectByTag("LOOT_JEWELRY_RINGS");
        break;
    case 34:
        oChest = GetObjectByTag("LOOT_MAGE_SPECIFIC");
        break;
    case 35:
        oChest = GetObjectByTag("LOOT_POLEARMS");
        break;
    case 36:
        oChest = GetObjectByTag("LOOT_POTIONS");
        break;
    case 37:
        oChest = GetObjectByTag("LOOT_RANGED_CROSSBOWS");
        break;
    case 38:
        oChest = GetObjectByTag("LOOT_RANGED_LONGBOWS");
        break;
    case 39:
        oChest = GetObjectByTag("LOOT_RANGED_SHORTBOWS");
        break;
    case 40:
        oChest = GetObjectByTag("LOOT_SCROLLS");
        break;

    case 41:
        oChest = GetObjectByTag("LOOT_SHIELD_LARGE");
        break;
    case 42:
        oChest = GetObjectByTag("LOOT_SHIELD_SMALL");
        break;
    case 43:
        oChest = GetObjectByTag("LOOT_SHIELD_TOWER");
        break;
    case 44:
        oChest = GetObjectByTag("LOOT_THROWING");
        break;
    default:
        CreateItemOnObject("nw_it_gold001", oPC, d100(GetHitDice(OBJECT_SELF)));
        return;
    }

    int nCount = GetLocalInt(oChest, "GenerateRandomLootTreature"),
        nPick;

    //  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem = GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem = GetNextItemInInventory(oChest);
        }

        while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "GenerateRandomLootTreature", nCount);
    }

    //  After we do a count of the placeables inventory we select a random item to copy
    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem = GetNextItemInInventory(oChest);
    }

    //  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

    if (GetBaseItemType(oCopy) == BASE_ITEM_ARMOR)
    {
        oCopy = IPDyeArmor(oCopy, ITEM_APPR_ARMOR_COLOR_CLOTH1, Random(63));
        oCopy = IPDyeArmor(oCopy, ITEM_APPR_ARMOR_COLOR_CLOTH2, Random(63));
        oCopy = IPDyeArmor(oCopy, ITEM_APPR_ARMOR_COLOR_LEATHER1, Random(63));
        oCopy = IPDyeArmor(oCopy, ITEM_APPR_ARMOR_COLOR_LEATHER2, Random(63));
        oCopy = IPDyeArmor(oCopy, ITEM_APPR_ARMOR_COLOR_METAL1, Random(63));
        oCopy = IPDyeArmor(oCopy, ITEM_APPR_ARMOR_COLOR_METAL2, Random(63));

        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_BELT, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_LBICEP, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_LFOOT, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_LFOREARM, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_LHAND, X2_IP_ARMORTYPE_RANDOM, TRUE);

        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_LSHIN, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_LSHOULDER, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_LTHIGH, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_NECK, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_PELVIS, X2_IP_ARMORTYPE_RANDOM, TRUE);

        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_RBICEP, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_RFOOT, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_RFOREARM, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_RHAND, X2_IP_ARMORTYPE_RANDOM, TRUE);

        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_RSHIN, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_RSHOULDER, X2_IP_ARMORTYPE_RANDOM, TRUE);
        oCopy = IPGetModifiedArmor(oCopy, ITEM_APPR_ARMOR_MODEL_RTHIGH, X2_IP_ARMORTYPE_RANDOM, TRUE);
    }

    //  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, FALSE);
    SetName(oCopy, RandomName(Random(23 - 1)) + " " + GetName(oCopy, TRUE));
}

/*void main () {}
