void main()
{
    object oPC = GetEnteringObject();

    SendMessageToPC(oPC, "Although there are no chickens to be seen, you see a trough full of chicken feed.\nThere are hundreds of chicken tracks, and even a few feathers here and there, but no chickens.");

    object oEgg = GetItemPossessedBy(oPC, "Egg");
    if (oEgg == OBJECT_INVALID)
    {
        return;
    }

    object oFeed = GetItemPossessedBy(oPC, "Feed");
    if (oFeed == OBJECT_INVALID)
    {
        DestroyObject(oFeed);
        return;
    }

    object oSkull = GetItemPossessedBy(oPC, "Skull");
    if (oSkull == OBJECT_INVALID)
    {
        DestroyObject(oSkull);
        return;
    }

    object oFeather = GetItemPossessedBy(oPC, "Feather");
    if (oFeather == OBJECT_INVALID)
    {
        DestroyObject(oFeather);
        return;
    }

    DestroyObject(oEgg);
    DestroyObject(oFeed);
    DestroyObject(oSkull);
    DestroyObject(oFeather);

    DelayCommand(1.2, SendMessageToPC(oPC, "Suddenly, a vortex opens underneath you, and you are sucked into it!"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_IMPLOSION), GetLocation(oPC));
    DelayCommand(3.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("chicken")))));
}
