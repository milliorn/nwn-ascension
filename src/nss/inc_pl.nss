//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//:://////////////////////////////////////////////

//  Respawn Placeable object
void RespawnObject(string sTag, int iType, location lLoc);

void RespawnObject(string sTag, int iType, location lLoc)
{
    CreateObject(iType, GetStringLowerCase(GetStringLeft(sTag, 16)), lLoc);
}

//void main()
