#include "inc_discord"

const float F_HIDE = 6.0;
const float F_PICK_POCKET = 60.0;

//  Check if we are a pc or dm
int GetIsClient(object oPC = OBJECT_SELF);

int GetIsClient(object oPC = OBJECT_SELF)
{
    return GetIsPC(oPC) || GetIsDM(oPC);
}


//void main() {}
