void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF);

    switch (d6())
    {
        case 1:
            AssignCommand(OBJECT_SELF, PlayVoiceChat(VOICE_CHAT_BATTLECRY1, OBJECT_SELF));
        case 2:
            AssignCommand(OBJECT_SELF, PlayVoiceChat(VOICE_CHAT_BATTLECRY2, OBJECT_SELF));
            break;
        case 3:
            AssignCommand(OBJECT_SELF, PlayVoiceChat(VOICE_CHAT_BATTLECRY3, OBJECT_SELF));
            break;
        case 4:
            AssignCommand(OBJECT_SELF, PlayVoiceChat(VOICE_CHAT_ATTACK, OBJECT_SELF));
            break;
        case 5:
            AssignCommand(OBJECT_SELF, PlayVoiceChat(VOICE_CHAT_LAUGH, OBJECT_SELF));
            break;
        case 6:
            AssignCommand(OBJECT_SELF, PlayVoiceChat(VOICE_CHAT_TAUNT, OBJECT_SELF));
            break;
    }

    AssignCommand(oPC, ClearAllActions());
    SetCommandable(FALSE, oPC);

    AssignCommand(OBJECT_SELF, JumpToLocation(GetLocation(oPC)));
    AssignCommand(OBJECT_SELF, ActionAttack(oPC));
    DelayCommand(3.0, SetCommandable(TRUE, oPC));
}
