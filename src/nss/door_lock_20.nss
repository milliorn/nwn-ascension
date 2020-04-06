////closing doors / locking
//:://////////////////////////////////////////////
//:: Created By: JEC
//:: Created On: 17-JUL-2002
//:://////////////////////////////////////////////
void main()
{
    object oDoor = OBJECT_SELF;
    DelayCommand( 20.0, ActionCloseDoor(oDoor) );
    if ( GetLockLockable( oDoor ) ) {
        SetLocked( oDoor, TRUE );
    }
}
