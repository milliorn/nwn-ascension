//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-03
//::
//:://////////////////////////////////////////////
void main()
{
    object oPC = GetEnteringObject();
    object oNPC = GetNearestObjectByTag("TownWatch1");

    if (!GetIsPC(oPC))
        return;

    if (GetHitDice(oPC) > 0 && GetHitDice(oPC) < 2)
    {
        AssignCommand(oNPC, SpeakString("Welcome to Ascension. This realms magic is slightly different from other realms. Read the signs. The rules are enforced. Ignorance is no excuse."));
    }

    if (GetHitDice(oPC) > 1 && GetHitDice(oPC) < 3 && d6() < 3)
    {
        switch (d6())
        {
            case 1:
                AssignCommand(oNPC, SpeakString("Young adventurers should try the Tavern Cellar, or the town cemetery at night."));
                break;
            case 2:
                AssignCommand(oNPC, SpeakString("Once you have dirtied your hands, try the areas to the west of town."));
                break;
            case 3:
                AssignCommand(oNPC, SpeakString("If you get a chance, clear out some of the Goblins north of here."));
                break;
            case 4:
                AssignCommand(oNPC, SpeakString("To the west just past a cave you should look out for Kobolds."));
                break;
            case 5:
                AssignCommand(oNPC, SpeakString("There used to be pirates in an undergound cove west of here. Some say thier bones still walk."));
                break;
            case 6:
                AssignCommand(oNPC, SpeakString("Some say there are Orcs and Bandits west of town. Aren't they pretty much the same thing?"));
                break;
        }
    }

    if (GetHitDice(oPC) > 3 && GetHitDice(oPC) < 6 && d6() < 3)
    {
        switch (d6())
        {
            case 1:
                AssignCommand(oNPC, SpeakString("The Swamp of Decay is more like a road recently with all the traffic out there.."));
                break;
            case 2:
                AssignCommand(oNPC, SpeakString("We haven't located it, but we know there is a Bugbear Stronghold of some sort near the swamp."));
                break;
            case 3:
                AssignCommand(oNPC, SpeakString("Goblins, lots of them, have a camp to the north, but we can't find them."));
                break;
            case 4:
                AssignCommand(oNPC, SpeakString("Some farmers found a Goblin Key and went searching for the nasty critters, but none returned."));
                break;
            case 5:
                AssignCommand(oNPC, SpeakString("Theres a wizard lives north of town who knows a lot about Goblins."));
                break;
            case 6:
                AssignCommand(oNPC, SpeakString("You know whats worse than Goblins? Hobgoblins!"));
                break;
        }
    }

    if (GetHitDice(oPC) > 6 && GetHitDice(oPC) < 12 && d6() < 3)
    {
        switch (d6())
        {
            case 1:
                AssignCommand(oNPC, SpeakString("There is a forest famous for being difficult to find your way out of."));
                break;
            case 2:
                AssignCommand(oNPC, SpeakString("Anduins Temple Ruins still stand north of chasm in the Swamp of Decay."));
                break;
            case 3:
                AssignCommand(oNPC, SpeakString("The parts of Anduins Staff are supposedly in some strange forest."));
                break;
            case 4:
                AssignCommand(oNPC, SpeakString("Hazel lives west of the Ogres, and knows everything about Anduins Staff."));
                break;
            case 5:
                AssignCommand(oNPC, SpeakString("I have heard that trolls have found a new home in the Abandoned Mansion."));
                break;
            case 6:
                AssignCommand(oNPC, SpeakString("Rumour says that the Sage stays in the town for a good reason."));
                break;
        }
    }

    if (GetHitDice(oPC) > 13 && GetHitDice(oPC) < 16 && d6() < 3)
    {
        switch (d6())
        {
            case 1:
                AssignCommand(oNPC, SpeakString("Anduins Staff might reveal a way into his temple."));
                break;
            case 2:
                AssignCommand(oNPC, SpeakString("Folks say the old priests who served Anduin are damned to living death forever."));
                break;
            case 3:
                AssignCommand(oNPC, SpeakString("I think you use the magic fountain by the tavern to get to Anduins Temple Ruins."));
                break;
            case 4:
                AssignCommand(oNPC, SpeakString("There are Giants to the west of Anduins Temple Ruins, and Renders to the west."));
                break;
            case 5:
                AssignCommand(oNPC, SpeakString("Can you believe there are some Giants with control over a Dragon!!!"));
                break;
            case 6:
                AssignCommand(oNPC, SpeakString("Anduins Catacombs supposedly lead eventualy to the underdark."));
                break;
        }
    }
    if (GetHitDice(oPC) > 15 && GetHitDice(oPC) < 18 && d6() < 3)
    {
        switch (d6())
        {
            case 1:
                AssignCommand(oNPC, SpeakString("Drow War Parties often attack small groups under Anduins Temple."));
                break;
            case 2:
                AssignCommand(oNPC, SpeakString("Archemlis is a coward and will run if he feels he is outmatched."));
                break;
            case 3:
                AssignCommand(oNPC, SpeakString("Archemlis likes to use ambushes, complete with traps, to overwhelm his victim."));
                break;
            case 4:
                AssignCommand(oNPC, SpeakString("Small parties have been ambushed recently by Drow War parties under Anduins Temple."));
                break;
            case 5:
                AssignCommand(oNPC, SpeakString("Rumour says Archemlis actualy gets paid to kill intruders of the underdark."));
                break;
            case 6:
                AssignCommand(oNPC, SpeakString("Archemlis is a human, but a traitor for making a pact with the Drow."));
                break;
        }
    }
}
