//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: 20-04-03
//::
//:://////////////////////////////////////////////
void main()
{
    object oPC;

    oPC = GetLastSpeaker();

    ActionCastFakeSpellAtObject(SPELL_NEGATIVE_ENERGY_BURST, oPC);
    SetXP(oPC, 1000);

    if (GetClassByPosition(1, oPC) == CLASS_TYPE_BARD ||
        GetClassByPosition(1, oPC) == CLASS_TYPE_ROGUE ||
        GetClassByPosition(1, oPC) == CLASS_TYPE_SORCERER ||
        GetClassByPosition(1, oPC) == CLASS_TYPE_WIZARD)
    {
        SetXP(oPC, 3000);
    }

    else
        SetXP(oPC, 1000);
}
