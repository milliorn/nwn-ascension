//::///////////////////////////////////////////////
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 2020-04-29
//::///////////////////////////////////////////////
void main()
{
    //the tease part
    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0);

    //the strip part
    object oItem = GetItemInSlot(INVENTORY_SLOT_CHEST);
    ActionUnequipItem(oItem);
    //more danceing
    ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_FORCEFUL, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_TALK_PLEADING, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT, 1.0);
    ActionPlayAnimation(ANIMATION_LOOPING_WORSHIP, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2, 1.0);
    ActionPlayAnimation(ANIMATION_FIREFORGET_BOW, 1.0);
    // getting dressed again. you need edit the cloths the npc is wearing and
    // change its tag to MyCloths for this to work.
    string sMyCloths = "MyCloths2";
    object oMyCloths = GetObjectByTag(sMyCloths);
    ActionEquipItem(oMyCloths, INVENTORY_SLOT_CHEST);
}

