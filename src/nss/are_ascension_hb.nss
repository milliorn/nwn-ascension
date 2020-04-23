//nw_02_onoff
void main()
{
    object oModule = GetModule();
    int iLights = GetLocalInt(oModule, "TOWN_LIGHTS");

    if (GetIsNight() && iLights == 0)
    {
        object oObject = GetFirstObjectInArea(OBJECT_SELF);
        while (GetIsObjectValid(oObject))
        {
            if (GetTag(oObject) == "TownLight")
            {
                SetPlaceableIllumination(oObject);
                AssignCommand(oObject, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
            }
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }

        RecomputeStaticLighting(OBJECT_SELF);
        SetLocalInt(oModule,"TOWN_LIGHTS", 1);
        return;
    }

    if (GetIsDay() && iLights == 1)
    {
        object oObject = GetFirstObjectInArea(OBJECT_SELF);
        while (GetIsObjectValid(oObject))
        {
            if (GetTag(oObject) == "TownLight")
            {
                SetPlaceableIllumination(oObject);
                AssignCommand(oObject, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
            }
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }

        RecomputeStaticLighting(OBJECT_SELF);
        SetLocalInt(oModule,"TOWN_LIGHTS", 0);
    }
}
