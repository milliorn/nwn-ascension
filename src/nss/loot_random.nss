#include "inc_loot"
void main()
{
    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        GenerateRandomLoot();
        SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
        DelayCommand(0.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));//600.0
    }
}
