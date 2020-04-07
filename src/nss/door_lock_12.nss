//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-06
//:://////////////////////////////////////////////

void main()
{
    DelayCommand(12.0, ActionCloseDoor(OBJECT_SELF));
    SetLocked(OBJECT_SELF, TRUE);
}

