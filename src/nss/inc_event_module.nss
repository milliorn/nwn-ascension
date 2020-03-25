//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 22, 2020
//::
//:://////////////////////////////////////////////

#include "x2_inc_itemprop"
#include "x3_inc_string"

//  Checks for the local int 'NPCTHIEF'  this is set in the onspawn script for
//  NPC's who can pickpocket
int IsThiefNPC(object oThief); // Check to see if thief is spec, quickling, etc

//  Set the Gold Piece value in the items Description
void PrintGPValue(object oItem);

//  Fix Barter Exploit that clones items
void FixBarterExploit(object oFrom, object oPC);

//  Display Custom Message to Party to notify what loot was acquired.
void LootMessage(string sItem, string sPlayer, object oFrom, object oPC);

//Send Faction Message
void SendMessageToFactionWithinDistance(object oPC, string sMessage, float fDist);


int IsThiefNPC(object oThief)
{
    if (!GetIsObjectValid(oThief))
        return 0;

    return GetLocalInt(oThief, "NPCThief");
}

void PrintGPValue(object oItem)
{
    string sDescribe = GetDescription(oItem, TRUE, TRUE),
           sGoldValue = IntToString(GetGoldPieceValue(oItem));

    if (GetPlotFlag(oItem) == FALSE)
    {
        string sOutput = StringToRGBString("Gold Piece Value: ", "770") + sGoldValue;
        sOutput += "\n";
        sOutput += "\n";
        sOutput += sDescribe;
        SetDescription(oItem, sOutput, TRUE);
    }
}

void FixBarterExploit(object oFrom, object oPC)
{
    if (GetIsPC(oFrom) && GetIsPC(oPC))
    {
        ExportSingleCharacter(oFrom);
        FloatingTextStringOnCreature(StringToRGBString("Character Saved", "070"), oFrom, FALSE);
        ExportSingleCharacter(oPC);
        FloatingTextStringOnCreature(StringToRGBString("Character Saved", "070"), oPC, FALSE);
        ExecuteScript("ws_saveall_sub", oFrom);
        ExecuteScript("ws_saveall_sub", oPC);
        return;
    }
}

void SendMessageToFactionWithinDistance(object oPC, string sMessage, float fDist)
{
    object oFaction = GetFirstFactionMember(oPC), oArea = GetArea(oPC);
    while (GetIsObjectValid(oFaction))
    {
        if (GetArea(oFaction) == oArea && GetDistanceBetween(oPC, oFaction) <= fDist)
        {
            DelayCommand(0.3, FloatingTextStringOnCreature(sMessage, oFaction));
        }

        oFaction = GetNextFactionMember(oPC);
    }
}

void LootMessage(string sItem, string sPlayer, object oFrom, object oPC)
{
    if (sItem == "")
    {
         SendMessageToFactionWithinDistance(oPC, StringToRGBString(sPlayer, "777")
         + " accquired "
         + StringToRGBString("Gold Pieces", "777"), 25.0);
         return;
    }
    else
    {
        if (oFrom == OBJECT_INVALID) return;

        SendMessageToFactionWithinDistance(oPC, StringToRGBString(sPlayer, "777")
        + " accquired "
        + StringToRGBString(sItem, "777"), 25.0);
    }
}

// * Applies an XP and GP penalty
// * to the player respawning
void ApplyPenalty(object oDead)
{
    int nXP = GetXP(oDead);
    int nPenalty = 75 * GetHitDice(oDead);
    int nHD = GetHitDice(oDead);
    // * You can not lose a level with this respawning
    int nMin = ((nHD * (nHD - 1)) / 2) * 1000;

    int nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
        nNewXP = nMin;
    SetXP(oDead, nNewXP);
    int nGoldToTake = FloatToInt(0.15 * GetGold(oDead));
    // * a cap of 10 000gp taken from you
    /*if (nGoldToTake > 1000000)
    {
        nGoldToTake = 1000000;
    }
    */

    AssignCommand(oDead, TakeGoldFromCreature(nGoldToTake, oDead, TRUE));
    DelayCommand(4.0, FloatingTextStrRefOnCreature(58299, oDead, FALSE));
    DelayCommand(4.8, FloatingTextStrRefOnCreature(58300, oDead, FALSE));
}

void main(){}
