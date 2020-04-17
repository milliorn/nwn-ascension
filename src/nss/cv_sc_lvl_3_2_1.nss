//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-15
//::
//:://////////////////////////////////////////////
// starting condition is met if player is less than 4th level.

int StartingConditional()
{
    return GetHitDice(GetPCSpeaker()) < 4 ;
}
