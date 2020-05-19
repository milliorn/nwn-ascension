//  Common Loot Generator Script
//  Created By: Scott Milliorn
//  Module - A Carpathian Nightmare
//  Date: June 13th, 2018

//  Additional help with donation of code from Dorrian of Trials of Newcastle

//  If any code is used from this script please give credit to both -
//  Milliorn of A Carpathian Nightmare
//  Dorrian of Trials of Newcastle

#include "x2_inc_itemprop"

//  Custom Code to Randomize the Coloring of Weapons.
void ColorWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC);

//  Custom Code from Dorrian, the Creator of Trials of Newcastle Module.  Modified by Milliorn.
void ColorArmor(object oItem, int cloth1, int cloth2, int leather1, int leather2, int meatal1, int meatal2, object oPC);

//  Custom Code to make random weapon appearances.
void ChangeApprWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC);

//  Custom Code to generate common equippable loot and to randomize Item Properties
void GenerateRandomLoot();



void ColorArmor(object oItem, int cloth1, int cloth2, int leather1, int leather2, int meatal1, int meatal2, object oPC)
{
    object oCopyBox = OBJECT_SELF;

    object oCopy = CopyItem(oItem,oCopyBox, TRUE);
    DestroyObject(oItem); // remove old item
    object oCopy1 = CopyItemAndModify(oCopy, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH1, cloth1, TRUE);
    DestroyObject(oCopy); // remove old item
    object oCopy2 = CopyItemAndModify(oCopy1, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_CLOTH2, cloth2, TRUE);
    DestroyObject(oCopy1); // remove old item
    object oCopy3 = CopyItemAndModify(oCopy2, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER1, leather1, TRUE);
    DestroyObject(oCopy2); // remove old item
    object oCopy4 = CopyItemAndModify(oCopy3, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_LEATHER2, leather2, TRUE);
    DestroyObject(oCopy3); // remove old item
    object oCopy5 = CopyItemAndModify(oCopy4, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL1, meatal1, TRUE);
    DestroyObject(oCopy4); // remove old item
    object oCopy6 = CopyItemAndModify(oCopy5, ITEM_APPR_TYPE_ARMOR_COLOR, ITEM_APPR_ARMOR_COLOR_METAL2, meatal2, TRUE);
    DestroyObject(oCopy5); // remove old item
    object oCopy7 = CopyItem(oCopy6,oPC, TRUE);
    DestroyObject(oCopy6); // remove old item
}

void ChangeApprWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC)
{
    object oCopyBox = OBJECT_SELF;

    object oCopy = CopyItem(oItem,oCopyBox, TRUE);
    DestroyObject(oItem); // remove old item
    object oCopy1 = CopyItemAndModify(oCopy, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_BOTTOM, iBottom, TRUE);
    DestroyObject(oCopy); // remove old item
    object oCopy2 = CopyItemAndModify(oCopy1, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_MIDDLE, iMiddle, TRUE);
    DestroyObject(oCopy1); // remove old item
    object oCopy3 = CopyItemAndModify(oCopy2, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, iTop, TRUE);
    DestroyObject(oCopy2); // remove old item
}

void ColorWeapon(object oItem, int iBottom, int iMiddle ,int iTop, object oPC)
{
    object oCopyBox = OBJECT_SELF;

    object oCopy = CopyItem(oItem,oCopyBox, TRUE);
    //DestroyObject(oItem); // remove old item
    object oCopy1 = CopyItemAndModify(oCopy, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_BOTTOM, iBottom, TRUE);
    DestroyObject(oCopy); // remove old item
    object oCopy2 = CopyItemAndModify(oCopy1, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_MIDDLE, iMiddle, TRUE);
    DestroyObject(oCopy1); // remove old item
    object oCopy3 = CopyItemAndModify(oCopy2, ITEM_APPR_TYPE_WEAPON_COLOR, ITEM_APPR_WEAPON_COLOR_TOP, iTop, TRUE);
    DestroyObject(oCopy2); // remove old item
}


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
        case 1: oChest = GetObjectByTag("LOOT_AMMO_ARROWS"); break;
        case 2: oChest = GetObjectByTag("LOOT_AMMO_BOLTS"); break;
        case 3: oChest = GetObjectByTag("LOOT_AMMO_BULLETS"); break;
        case 4: oChest = GetObjectByTag("LOOT_AMMO_CLOTHING"); break;
        case 5: oChest = GetObjectByTag("LOOT_AMMO_HEAVY"); break;
        case 6: oChest = GetObjectByTag("LOOT_AMMO_HELMET"); break;
        case 7: oChest = GetObjectByTag("LOOT_ARMOR_LIGHT"); break;
        case 8: oChest = GetObjectByTag("LOOT_ARMOR_MEDIUM"); break;
        case 9: oChest = GetObjectByTag("LOOT_ARMOR_NPC_CLOTHING"); break;
        case 10: oChest = GetObjectByTag("LOOT_AXES_GREAT"); break;

        case 11: oChest = GetObjectByTag("LOOT_AXES_ONE"); break;
        case 12: oChest = GetObjectByTag("LOOT_AXES_TWO"); break;
        case 13: oChest = GetObjectByTag("LOOT_BLADED_BASTARD"); break;
        case 14: oChest = GetObjectByTag("LOOT_BLADED_DAGGERS"); break;
        case 15: oChest = GetObjectByTag("LOOT_BLADED_GREAT"); break;
        case 16: oChest = GetObjectByTag("LOOT_BLADED_LONGSWORD"); break;
        case 17: oChest = GetObjectByTag("LOOT_BLADED_OTHER"); break;
        case 18: oChest = GetObjectByTag("LOOT_BLADED_SHORT"); break;
        case 19: oChest = GetObjectByTag("LOOT_BLUNTS_CLUBS"); break;
        case 20: oChest = GetObjectByTag("LOOT_BLUNTS_FLAILS"); break;

        case 21: oChest = GetObjectByTag("LOOT_BLUNTS_HAMMERS"); break;
        case 22: oChest = GetObjectByTag("LOOT_BLUNTS_MACES"); break;
        case 23: oChest = GetObjectByTag("LOOT_BLUNTS_MORNINGSTARS"); break;
        case 24: oChest = GetObjectByTag("LOOT_BOOKS"); break;
        case 25: oChest = GetObjectByTag("LOOT_BOOTS"); break;
        case 26: oChest = GetObjectByTag("LOOT_BRACERS"); break;
        case 27: oChest = GetObjectByTag("LOOT_CLOAKS"); break;
        case 28: oChest = GetObjectByTag("LOOT_DOUBLE_SIDED"); break;
        case 29: oChest = GetObjectByTag("LOOT_EXOTIC"); break;
        case 30: oChest = GetObjectByTag("LOOT_GAUNTLET"); break;

        case 31: oChest = GetObjectByTag("LOOT_GEMS"); break;
        case 32: oChest = GetObjectByTag("LOOT_JEWELRY_AMULET"); break;
        case 33: oChest = GetObjectByTag("LOOT_JEWELRY_RINGS"); break;
        case 34: oChest = GetObjectByTag("LOOT_MAGE_SPECIFIC"); break;
        case 35: oChest = GetObjectByTag("LOOT_POLEARMS"); break;
        case 36: oChest = GetObjectByTag("LOOT_POTIONS"); break;
        case 37: oChest = GetObjectByTag("LOOT_RANGED_CROSSBOWS"); break;
        case 38: oChest = GetObjectByTag("LOOT_RANGED_LONGBOWS"); break;
        case 39: oChest = GetObjectByTag("LOOT_RANGED_SHORTBOWS"); break;
        case 40: oChest = GetObjectByTag("LOOT_SCROLLS"); break;

        case 41: oChest = GetObjectByTag("LOOT_SHIELD_LARGE"); break;
        case 42: oChest = GetObjectByTag("LOOT_SHIELD_SMALL"); break;
        case 43: oChest = GetObjectByTag("LOOT_SHIELD_TOWER"); break;
        case 44: oChest = GetObjectByTag("LOOT_THROWING"); break;
        default: SetItemStackSize(CreateObject(OBJECT_TYPE_ITEM, "nw_it_gold001", GetLocation(oPC)), d100(100)); return;
    }

    int nCount = GetLocalInt(oChest, "GenerateRandomLootTreature"),
        nPick;

    //  Do a numeric count of all items in the placeables inventory
    if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
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
        oItem=GetNextItemInInventory(oChest);
    }

    //  Copy the item to the target inventory
    oCopy = CopyItem(oItem, oPC, TRUE);

    //  We now check to make sure all appropriate flags are set and give it a random name
    SetDroppableFlag(oCopy, TRUE);
    SetItemCursedFlag(oCopy, FALSE);
    SetPickpocketableFlag(oCopy, TRUE);
    SetStolenFlag(oCopy, FALSE);
    SetIdentified(oCopy, FALSE);
    SetName(oCopy, RandomName(Random(23 - 1)) + " " + GetName(oCopy, TRUE));
}


/*void main () {}