#include "x3_inc_string"
//  Print the CR of the Creature in the Description
void PrintCRValue(object oCreature);
void PrintCRValue(object oCreature)
{
    string sDescribe = GetDescription(oCreature, TRUE, TRUE);
    float fCR = GetChallengeRating(oCreature);

    string sOutput = "CR Value: " + FloatToString(fCR, 0, 2);
    sOutput += "\n";
    sOutput += "\n";
    sOutput += "STR: " + IntToString(GetAbilityScore(oCreature, ABILITY_STRENGTH));
    sOutput += "\n";
    sOutput += "DEX: " + IntToString(GetAbilityScore(oCreature, ABILITY_DEXTERITY));
    sOutput += "\n";
    sOutput += "CON: " + IntToString(GetAbilityScore(oCreature, ABILITY_CONSTITUTION));
    sOutput += "\n";
    sOutput += "INT: " + IntToString(GetAbilityScore(oCreature, ABILITY_INTELLIGENCE));
    sOutput += "\n";
    sOutput += "WIS: " + IntToString(GetAbilityScore(oCreature, ABILITY_WISDOM));
    sOutput += "\n";
    sOutput += "CHA: " + IntToString(GetAbilityScore(oCreature, ABILITY_CHARISMA));
    sOutput += "\n";
    sOutput += "AC: " + IntToString(GetAC(oCreature));
    sOutput += "\n";
    sOutput += "HP: " + IntToString(GetCurrentHitPoints(oCreature)) + "/" + IntToString(GetMaxHitPoints(oCreature));
    sOutput += "\n";
    sOutput += "BAB: " + IntToString(GetBaseAttackBonus(oCreature));
    sOutput += "\n";
    sOutput += "Fortitude: " + IntToString(GetFortitudeSavingThrow(oCreature));
    sOutput += "\n";
    sOutput += "Reflex: " + IntToString(GetReflexSavingThrow(oCreature));
    sOutput += "\n";
    sOutput += "Will: " + IntToString(GetWillSavingThrow(oCreature));
    sOutput += "\n";
    sOutput += "SR: " + IntToString(GetSpellResistance(oCreature));
    sOutput += "";
    sOutput += "\n";
    sOutput += "\n";
    sOutput += sDescribe;
    SetDescription(oCreature, sOutput, TRUE);
}

//  Randomize the settings of the npc and set there AI to high
void AIRandomSettings(object oCreature);
void AIRandomSettings(object oCreature)
{
    int iCompassion = d100(),
        iMagic      = d100(),
        iOffense    = d100();

    SetLocalInt(oCreature, "X2_L_BEH_OFFENSE", iOffense);

    if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oCreature) >= 1          ||
        GetLevelByClass(CLASS_TYPE_RANGER, oCreature) >= 1            ||
        GetLevelByClass(CLASS_TYPE_DRAGONDISCIPLE, oCreature) >= 1    ||
        GetLevelByClass(CLASS_TYPE_ROGUE, oCreature) >= 1             ||
        GetLevelByClass(CLASS_TYPE_SHADOWDANCER, oCreature) >= 1)
    {
        SetLocalInt(oCreature, "X2_L_SPAWN_USE_SEARCH", 1);
        SetLocalInt(oCreature, "X2_L_SPAWN_USE_STEALTH", 1);
    }

    if (GetLevelByClass(CLASS_TYPE_BARD, oCreature) >= 1       ||
        GetLevelByClass(CLASS_TYPE_CLERIC, oCreature) >= 1     ||
        GetLevelByClass(CLASS_TYPE_DRUID, oCreature) >= 1      ||
        GetLevelByClass(CLASS_TYPE_PALADIN, oCreature) >= 1    ||
        GetLevelByClass(CLASS_TYPE_RANGER, oCreature) >= 1     ||
        GetLevelByClass(CLASS_TYPE_SORCERER, oCreature) >= 1   ||
        GetLevelByClass(CLASS_TYPE_WIZARD, oCreature) >= 1)
    {
        SetLocalInt(oCreature, "X2_L_BEH_MAGIC", iMagic);
        SetLocalInt(oCreature, "X2_SPELL_RANDOM", 1);
        //SetSpawnInCondition(NW_FLAG_FAST_BUFF_ENEMY);
    }

    if (GetLevelByClass(CLASS_TYPE_BARD, oCreature) >= 1   ||
        GetLevelByClass(CLASS_TYPE_CLERIC, oCreature) >= 1 ||
        GetLevelByClass(CLASS_TYPE_DRUID, oCreature) >= 1  ||
        GetLevelByClass(CLASS_TYPE_PALADIN, oCreature) >= 1 ||
        GetLevelByClass(CLASS_TYPE_RANGER, oCreature) >= 1)
    {
        SetLocalInt(oCreature, "X2_L_BEH_COMPASSION", iCompassion);
    }

    SetAILevel(oCreature, AI_LEVEL_HIGH);
}

//  Display the CR Rating for the Boss script OnDeath
string CheckBossRating(object oDead, object oKiller);
string CheckBossRating(object oDead, object oKiller)
{
/*
     a rating of effortless is 6 levels lower
     a rating of easy is 4 to 5 levels lower
     a rating of moderate is 2 to 3 levels lower
     a rating f challenging is same or 1 level lower
     a rating of very difficult is 1 or 2 levels higher
     a rating of overpowering is 3 or 4 levels higher
     a rating of impossible is 5 or more levels higher.
*/
    int iPC = FloatToInt(GetChallengeRating(oDead)),
        iKiller = GetHitDice(oKiller);

        //iKiller_LL = GetLocalInt(GetItemPossessedBy(oKiller, "plotItemTag"), "nLegendLevel");

    //if (iKiller_LL > 40) iKiller = iKiller_LL;

    if (iPC + 6 <= iKiller)                            return " a rating "+ StringToRGBString("EFFORTLESS", STRING_COLOR_WHITE);
    else if (iPC + 5 == iKiller || iPC + 4 == iKiller) return " a rating "+ StringToRGBString("EASY", STRING_COLOR_GREEN);
    else if (iPC + 3 == iKiller || iPC + 2 == iKiller) return " a rating "+ StringToRGBString("MODERATE", STRING_COLOR_BLUE);
    else if (iPC + 1 == iKiller || iPC == iKiller)     return " a rating CHALLENGING";
    else if (iKiller + 2 == iPC || iKiller + 1 == iPC) return " a rating"+ StringToRGBString("VERY DIFFICULT", STRING_COLOR_PINK);
    else if (iKiller + 4 == iPC || iKiller + 3 == iPC) return " a rating "+ StringToRGBString("OVERPOWERING", STRING_COLOR_RED);
    else if (iKiller + 5 <= iPC)                       return " a rating "+ StringToRGBString("IMPOSSIBLE", STRING_COLOR_ROSE);

    // This should never display
    else return "an UNKNOWN rating";
}

//  Handle PC's who go hostile on non hostile npcs.
void IsPlotNoHostileAtNPC(object oPC);
void IsPlotNoHostileAtNPC(object oPC)
{
    if (GetPlotFlag(OBJECT_SELF))
    {
        FloatingTextStringOnCreature(StringToRGBString("WARNING!", STRING_COLOR_RED) +
        "Do not go hostile on non-hostile NPC's.  Now, escape from jail!", oPC);
        DelayCommand(2.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_JAIL")))));
        return;
    }
}

//  Send a Message if NPC dropped loot
void MarkLootAvailable();
void MarkLootAvailable()
{
    object oItem = GetFirstItemInInventory(OBJECT_SELF);
    while (GetIsObjectValid(oItem) && GetLocalInt(oItem, "LOOT_DROP"))
    {
        DelayCommand(1.0, FloatingTextStringOnCreature("Loot Available", GetLastKiller(), TRUE));
        DeleteLocalInt(oItem, "LOOT_DROP");
        oItem = GetNextItemInInventory(OBJECT_SELF);
    }
}

//
void NPCSpeakStringOnDeath();
void NPCSpeakStringOnDeath()
{
    // Call to allies to let them know we're dead
    SpeakString("NW_I_AM_DEAD", TALKVOLUME_SILENT_TALK);

    //Shout Attack my target, only works with the On Spawn In setup
    SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_TALK);
}


//void main(){}
