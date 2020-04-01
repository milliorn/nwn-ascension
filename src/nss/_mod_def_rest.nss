///////////
//Sometimes spawn monster in during rest v1.2
///////////
//This script rolls a D6 and spawns a monster with a CR
//of your level if a 1 is rolled, or spawns a monster with
//a CR of 1 higher than your level if a 2 is rolled.
///////////
//Script by Michael Ham (mindtakerr)
//Date Created: 6/24/02
//Modifed By Alan Guile (spidey)
//Date Modifed 7/18/02
// Simplified resting check and added local area variable check for safe
//areas just add to your on enter script to set local int for the area to
//restsafe = 1
//Filename: ag_monster_rest
///////////

//:://////////////////////////////////////////////
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-03-31
//:://////////////////////////////////////////////

#include "inc_event_module"

// Modified version of the original PoA code
void RestAmbush(object oPC);
void RestAmbush(object oPC)
{
    if (!GetIsPC(oPC))
        return;

    object oArea = GetArea(oPC);
    object oEnemy;

    // Set a location for where the PC is
    location lLoc = GetLocation(oPC);

    // find level of pc
    int iLevel = GetHitDice(oPC);
    int nNumMon;
    int nC = 2;

    //  Check to see if area is a rest safe area will have to set value of
    //  restsafe to 1 in on enter script
    int nMonChance = GetLocalInt(oArea, "nMonChance");
    string sMonster = GetLocalString(oArea, "sMonster");

    // Check to see whether resting has started or is over
    int nRestTurn = GetLocalInt(oPC, "nRestTurns");
    SetLocalInt(oPC, "nRestTurns", nRestTurn + 1);

    if (GetLocalInt(GetArea(oPC), "REST_DEATH") == TRUE)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDeath(TRUE, TRUE)), oPC);
        DelayCommand(2.0, SendMessageToPC(oPC, "Whilst you were slipping, Consciousness fails you and darkness greets you."));
    }

    // Determine whether rest will be peaceful or not
    if (nMonChance >= 1 && nRestTurn == 1 && Random(100) <= nMonChance && sMonster != "" && sMonster == "drowwarrior003")
    {
        // Create the enemy at the PC's location
        oEnemy = CreateObject(OBJECT_TYPE_CREATURE, sMonster, lLoc, FALSE);
        // Tell the enemy to attack the player
        AssignCommand(oEnemy, ActionAttack(oPC));
        //Figure Number of creatures
        nNumMon = FloatToInt(iLevel / (GetChallengeRating(oEnemy) + 1));

        if (nNumMon > 4)
            nNumMon = 4;

        while (nC <= nNumMon)
        {
            // Create the enemy at the PC's location
            oEnemy = CreateObject(OBJECT_TYPE_CREATURE, sMonster, lLoc, FALSE);
            // Tell the enemy to attack the player
            AssignCommand(oEnemy, ActionAttack(oPC));
            oEnemy = CreateObject(OBJECT_TYPE_CREATURE, sMonster, lLoc, FALSE);
            // Tell the enemy to attack the player
            AssignCommand(oEnemy, ActionAttack(oPC));
            nC++;
        }
    }
    else
    {
        // Create the enemy at the PC's location
        oEnemy = CreateObject(OBJECT_TYPE_CREATURE, sMonster, lLoc, FALSE);
        // Tell the enemy to attack the player
        AssignCommand(oEnemy, ActionAttack(oPC));
        //Figure Number of creatures
        nNumMon = FloatToInt(iLevel / (GetChallengeRating(oEnemy) + 1));

        if (nNumMon > 4)
            nNumMon = 4;

        while (nC <= nNumMon)
        {
            // Create the enemy at the PC's location
            oEnemy = CreateObject(OBJECT_TYPE_CREATURE, sMonster, lLoc, FALSE);
            // Tell the enemy to attack the player
            AssignCommand(oEnemy, ActionAttack(oPC));
            oEnemy = CreateObject(OBJECT_TYPE_CREATURE, sMonster, lLoc, FALSE);
            // Tell the enemy to attack the player
            AssignCommand(oEnemy, ActionAttack(oPC));
            nC++;
        }
    }

    //  The PC alerts of danger
    PlayVoiceChat(Random(3), oPC);
    SignalEvent(oArea, EventUserDefined(201));
    SetLocalInt(oPC, "nRestTurns", 0);
}

void main()
{
    object oPC = GetLastPCRested();

    switch (GetLastRestEventType())
    {
        case REST_EVENTTYPE_REST_STARTED:
        {
            PlayVoiceChat(VOICE_CHAT_REST, oPC);
            FadeToBlack(oPC, FADE_SPEED_SLOWEST);
            DelayCommand(6.0, RestAmbush(oPC));
            break;
        }
        case REST_EVENTTYPE_REST_CANCELLED:
        case REST_EVENTTYPE_REST_FINISHED:
        {
            FadeFromBlack(oPC, FADE_SPEED_SLOWEST);
            SaveClient(oPC);
            break;
        }
    }
}

