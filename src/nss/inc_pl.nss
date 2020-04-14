//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-05
//:://////////////////////////////////////////////

//  Respawn Placeable object
void RespawnObject();

void RespawnObject()
{
    CreateObject(GetObjectType(OBJECT_SELF), GetResRef(OBJECT_SELF), GetLocation(OBJECT_SELF));
}

//void main()
