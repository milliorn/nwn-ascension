//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-12
//:://////////////////////////////////////////////

void main()
{
    object oEnter = GetEnteringObject(),
           oWP = GetWaypointByTag("WP_Sage_04");

    if (OBJECT_INVALID == GetNearestObjectByTag("Sage", oWP))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "sage", GetLocation(oWP));
    }
}
