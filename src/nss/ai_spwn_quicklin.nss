//:://////////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-08
//:://////////////////////////////////////////////////

#include "x0_i0_anims"
//#include "x0_i0_walkway" - in x0_i0_anims
//#include "x0_i0_treasure"
//#include "x2_inc_switches"

void main()
{
    DelayCommand(1.0, AssignCommand(OBJECT_SELF, ActionCastSpellAtObject(SPELL_TRUE_SEEING, OBJECT_SELF, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
    SetSpawnInCondition(NW_FLAG_APPEAR_SPAWN_IN_ANIMATION);
    SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE); // OPTIONAL BEHAVIOR (Flee to a way point and do not return.)
    SetSpawnInCondition(NW_FLAG_STEALTH);

    SetListeningPatterns();

    WalkWayPoints();
}
