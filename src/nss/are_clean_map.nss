// -------------------------------------------------------------------------- //
//
// Script:  area_clean
//
// Use:     Despawns everything out of an area after a PC left and no others
//          are still there.
//
// Created: 04.17.2006
//
// By:      Elwoodini
//
// -------------------------------------------------------------------------- //

// function removes all objects in inventory then object itself.
void TrashObject(object oObject)
{
    /* search and destroy contents of body bag's, others just destroy */
    if (GetHasInventory(oObject))
    {
        object oItem = GetFirstItemInInventory(oObject);
        /* recursively trash all items inside container */
        while (GetIsObjectValid(oItem))
        {
            TrashObject(oItem);
            oItem = GetNextItemInInventory(oObject);
        }
    }
    DestroyObject(oObject);
}

void main()
{
    object oPC = GetExitingObject();

    // only execute for PC's exiting an area
    if (GetIsPC(oPC))
    {
        // Start up the loop, setting oPC now to the first PC
        oPC = GetFirstPC();
        // Continue looping until there are no more PCs left
        while (oPC != OBJECT_INVALID)
        {
            // Check the Area against the Area of the current PC, and if they are the same
            // exit the function, as we do not need to check anymore PCs
            if(OBJECT_SELF == GetArea(oPC))
                return;
            // If not, continue to the next PC
            else
                oPC = GetNextPC();
        }
        // If we've made it this far, we know that there aren't any PCs in the area
        // Set oObject to the first object in the Area
        object oObject = GetFirstObjectInArea(OBJECT_SELF);
        // Continue looping until there are no more objects left
        while (oObject != OBJECT_SELF && GetIsObjectValid(oObject))
        {
            // Test to see if oObject is a creature spawned from an encounter and if so,
            // destroy the object
            switch (GetObjectType(oObject))
            {
                case OBJECT_TYPE_ITEM:
                    TrashObject(oObject);
                    break;
                case OBJECT_TYPE_PLACEABLE:
                    if(GetTag(oObject) == "BodyBag")
                        TrashObject(oObject);
                    break;
                case OBJECT_TYPE_CREATURE:
                    if(GetMaster(oObject) == OBJECT_INVALID)
                    {
                        AssignCommand(oObject, SetIsDestroyable(TRUE, FALSE, FALSE));
                        TrashObject(oObject);
                    }
                    break;
                case OBJECT_TYPE_AREA_OF_EFFECT:
                    DestroyObject(oObject);
                    break;
            }

            // Move on to the next object
            oObject = GetNextObjectInArea(OBJECT_SELF);
        }
    }
}
