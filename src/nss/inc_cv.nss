//  Check if we have that item and destroy it
void HasItemNW_WSWMLS013(object oPC, object oItem);

void HasItemNW_WSWMLS013(object oPC, object oItem)
{
    if (GetIsObjectValid(oItem) != 0)
    {
        DestroyObject(oItem);
    }
}

//void main () {}
