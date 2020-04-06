//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-03
//::
//:://////////////////////////////////////////////
void main()
{
    object oNPC = GetObjectByTag("leveler");
    AssignCommand(oNPC, ActionCastSpellAtObject(SPELL_SHADOW_SHIELD, oNPC, METAMAGIC_ANY, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, FALSE));
    AssignCommand(oNPC, ActionCastSpellAtObject(SPELL_PREMONITION, oNPC, METAMAGIC_ANY, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, FALSE));
    AssignCommand(oNPC, ActionCastSpellAtObject(SPELL_GLOBE_OF_INVULNERABILITY, oNPC, METAMAGIC_ANY, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, FALSE));
}
