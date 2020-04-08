//:://////////////////////////////////////////////
//:: Created By: Rich Dersheimer
//:: Created On: July 5, 2002
//:: Modified By: Scott Milliorn
//:: Modified On: 2020-04-03
//:://////////////////////////////////////////////

#include "nw_i0_tool"
#include "x3_inc_string"


//  Check PC inventory for excess items
void CheckItemLimit(object oPC);

//  Check if we possess the crown or immortal daggers
void LokiTheft(object oEnter);


void CheckItemLimit(object oPC)
{
    int iLimit = 131;

    if (GetIsDM(oPC) || !GetIsPC(oPC))
    {
        return;
    }

    int x;
    object oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem))
    {
        x++;
        oItem = GetNextItemInInventory(oPC);
    }

    if (x >= iLimit)
    {
        ActionWait(0.2);
        location loc = GetLocation(GetWaypointByTag("WP_ENCUMBRIA"));
        AssignCommand(oPC, ActionJumpToLocation(loc));
        return;
    }
}

void LokiTheft(object oEnter)
{
    object oCrown = GetItemPossessedBy(oEnter, "ImmortalCrown");

    if (GetIsPC(oEnter) && HasItem(oEnter, "LokisEye"))
    {
        if (oCrown != OBJECT_INVALID)
        {
            AssignCommand(oEnter, DestroyObject(oCrown));
        }

        oCrown = GetItemPossessedBy(oEnter, "immortaldagger1");
        if (oCrown != OBJECT_INVALID)
        {
            AssignCommand(oEnter, DestroyObject(oCrown));
        }

        object oCrown = GetItemPossessedBy(oEnter, "immortaldagger2");
        if (oCrown != OBJECT_INVALID)
        {
            AssignCommand(oEnter, DestroyObject(oCrown));
        }

        SendMessageToPC(oEnter, StringToRGBString("LOKI'S WRATH", "700")
        + StringToRGBString(" HAS BEEN VISITED UPON YOU! YOU SHALL NOT HAVE THE EYE!", "777"));

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE, FALSE), oEnter);
        DestroyObject(GetItemPossessedBy(oEnter, "LokisEye"));
        DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE, TRUE), oEnter));
    }
}
//void main(){}
