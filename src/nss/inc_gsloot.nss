//  Function library set to prevent and punish Greater Sanctuary looting
//  Created by AW Olorin 1-11-2004
//  To use these functions in a script on PoA just place the line
//  #include "gsloot_lib"  at the begining of your script.
/*
##  This Library contains 5 functions to prevent people from
##  looting containers while under Greater Sanctuary.
*/

int GS_Check(object oPC, int iFlag = FALSE);
void RogueSpectreSpawn(object oPC);
float GetRandomFloat(float fMinimumTime = 0.4, float MaximumTime = 1.1);
void DropNote(location oLocation);
void DestroyInventory(object oContainer = OBJECT_SELF);

// Check to see if PC is under GS. Returns 1 if true.  If Flag is TRUE
// GS effect will also be removed from player by this function.
// NOTE:  We want DM's and NPC's to do anything they want in GS
// So this function will return FALSE if the object being
// Checked is a DM or NPC even if they ARE under GS
int GS_Check(object oPC, int iFlag = FALSE)
{
    if (GetIsDM(oPC) || (!GetIsPC(oPC)))
        return 0;
    effect eGS_Check = GetFirstEffect(oPC);
    while (GetIsEffectValid(eGS_Check))
    {
        if (GetEffectType(eGS_Check) == EFFECT_TYPE_SANCTUARY)
        {
            if (iFlag)
                RemoveEffect(oPC, eGS_Check);
            return 1;
        }
        eGS_Check = GetNextEffect(oPC);
    }
    return 0;
}

// will spawn 1 Rogue Spectre per two levels of PC in random points around
// the PC in all direction between 1 and 2 meters away.
void RogueSpectreSpawn(object oPC)
{
    location locSpawn;
    vector vPC = GetPosition(oPC);
    vector vSpectre = vPC;
    int iLoops = (GetHitDice(oPC) / 2);
    int iCounter = 0;

    while (iCounter < iLoops)
    {
        vSpectre.y = vPC.y + GetRandomFloat(0.1, 4.0) - 2.0;
        vSpectre.x = vPC.x + GetRandomFloat(0.1, 4.0) - 2.0;
        locSpawn = Location(GetArea(oPC), vSpectre, 0.0f);
        vSpectre = vPC;
        CreateObject(OBJECT_TYPE_CREATURE, "roguespectre", locSpawn, TRUE);
        iCounter++;
    }
}

// Generates a random float value between fMinimum and fMaximum
float GetRandomFloat(float fMinimum, float Maximum)
{
    float fRandom = Maximum - fMinimum;
    int nRandom;
    if (fRandom < 0.0)
    {
        return 0.0;
    }
    else
    {
        nRandom = FloatToInt(fRandom * 10.0);
        nRandom = Random(nRandom) + 1;
        fRandom = IntToFloat(nRandom);
        fRandom /= 10.0;
        return fRandom + fMinimum;
    }
}

//  Will drop a note telling player GS looting is bad.
void DropNote(location locLocation)
{
    CreateObject(OBJECT_TYPE_ITEM, "smallnote", locLocation, FALSE);
}

//  Destroys the contents of a container
void DestroyInventory(object oContainer = OBJECT_SELF)
{
    object oInventory;

    if (!GetIsObjectValid(oContainer))
        return;
    oInventory = GetFirstItemInInventory(oContainer);
    while (GetIsObjectValid(oInventory))
    {
        DestroyObject(oInventory, 0.0f);
        oInventory = GetNextItemInInventory(oContainer);
    }
}
