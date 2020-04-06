//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//::///////////////////////////////////////////////
//:: FileName feyland
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 11/5/2002 2:10:58 PM
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();

    //jump the PC to the destination
    AssignCommand(oPC, JumpToObject(GetWaypointByTag("feyentrance")));

    // Remove items from the player's inventory
    object oItemToTake = GetItemPossessedBy(oPC, "FertileFaeryseeds");

    if (GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);
}
