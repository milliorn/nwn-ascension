//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//:://////////////////////////////////////////////

//  Modified by AW Olorin 1-12-2004
//  Anti-GS Looting

void RespawnObject(string sTag, int iType, location lLoc)
{
    CreateObject(iType, GetStringLowerCase(GetStringLeft(sTag, 16)), lLoc);
}

void main()
{
    location lLoc = GetLocation(OBJECT_SELF);
    string sTag = GetTag(OBJECT_SELF);
    int iType = GetObjectType(OBJECT_SELF);

    CreateObject(OBJECT_TYPE_ITEM, "brokenloot", lLoc);


    DestroyObject(OBJECT_SELF);
    AssignCommand(GetArea(OBJECT_SELF), DelayCommand(12.0, RespawnObject(sTag, iType, lLoc)));
}

