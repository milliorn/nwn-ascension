//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-12
//::///////////////////////////////////////////////
void main()
{
    object oPC = GetPCSpeaker();
    object oMember = GetFirstFactionMember(oPC);
    while (oMember != OBJECT_INVALID)
    {
        if (GetArea(oPC) == GetArea(oMember))
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_IMPLOSION), GetLocation(oMember));
            DelayCommand(3.5, AssignCommand(oMember, JumpToLocation(GetLocation(GetWaypointByTag("abyssentry")))));
        }

        oMember = GetNextFactionMember(oPC);
    }
}
