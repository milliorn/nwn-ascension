#include "x3_inc_string"

const string MESSAGEONE = " Type !<name of shortcut> all in one word to access the command.";
const string MESSAGETWO = " They can be typed into any chat channel except private channel.";
const string MESSAGETHREE = "These are the commands you can use in chat.";

//List all Emote Commands
void ChatListEmotes(object oPC);
void ChatListEmotes(object oPC)
{
    SendMessageToPC(oPC, "Emotes:");

    SendMessageToPC(oPC, "These are the emotes you can use in chat." +
                             MESSAGETWO + " Type *<name of shortcut> all in one word to access the emote.");

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Bad Idea (*bi)");
    SendMessageToPC(oPC, "Beg (*be)");
    SendMessageToPC(oPC, "Bend Forward (*bf)");
    SendMessageToPC(oPC, "Bored (*bo)");
    SendMessageToPC(oPC, "Cheer (Yes) (*gr)");
    SendMessageToPC(oPC, "Conjure (*co)");
    SendMessageToPC(oPC, "Dance (*da)");
    SendMessageToPC(oPC, "Dodge (*do)");
    SendMessageToPC(oPC, "Drunk (*dr)");
    SendMessageToPC(oPC, "Duck (*du)");
    SendMessageToPC(oPC, "Fall Back (*fb)");
    SendMessageToPC(oPC, "Fall Front (*ff)");
    SendMessageToPC(oPC, "Goodbye (*go)");
    SendMessageToPC(oPC, "Greeting (*gr)");
    SendMessageToPC(oPC, "Invoke (*in)");
    SendMessageToPC(oPC, "Laugh (*la)");
    SendMessageToPC(oPC, "Lean Over (*lo)");
    SendMessageToPC(oPC, "Listen (*li)");
    SendMessageToPC(oPC, "Meditate (*me)");
    SendMessageToPC(oPC, "Moan (*mo)");
    SendMessageToPC(oPC, "No (*no)");
    SendMessageToPC(oPC, "Puke (*pu)");
    SendMessageToPC(oPC, "Read (*re)");
    SendMessageToPC(oPC, "Salute (*sa)");
    SendMessageToPC(oPC, "Search (*se)");
    SendMessageToPC(oPC, "Sip (*si)");
    SendMessageToPC(oPC, "Spasm (*sp)");
    SendMessageToPC(oPC, "Squat (*sq)");
    SendMessageToPC(oPC, "Steal (*st)");
    SendMessageToPC(oPC, "Taunt (*ta)");
    SendMessageToPC(oPC, "Tired (*ti)");
    SendMessageToPC(oPC, "Worship (*wo)");
}

// List all Weapon Commands
void ChatListWeapons(object oPC);
void ChatListWeapons(object oPC)
{
    SendMessageToPC(oPC, "Weapon VFX:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Acid (!wpac)");
    SendMessageToPC(oPC, "Cold (!wpco)");
    SendMessageToPC(oPC, "Electric (!da)");
    SendMessageToPC(oPC, "Evil (!wpev)");
    SendMessageToPC(oPC, "Fire (!wpfi)");
    SendMessageToPC(oPC, "Holy (Yes) (!wpho)");
    SendMessageToPC(oPC, "Sonic (!wpso)");
}

// List all Dice Commands
void ChatListDice(object oPC);
void ChatListDice(object oPC)
{
    SendMessageToPC(oPC, "Dice Rolls:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "!d10");
    SendMessageToPC(oPC, "!d100");
    SendMessageToPC(oPC, "!d12");
    SendMessageToPC(oPC, "!d2");
    SendMessageToPC(oPC, "!d20");
    SendMessageToPC(oPC, "!d3");
    SendMessageToPC(oPC, "!d4");
    SendMessageToPC(oPC, "!d6");
    SendMessageToPC(oPC, "!d8");
}

// List all Alignment Commands
void ChatListAlignment(object oPC);
void ChatListAlignment(object oPC)
{
    SendMessageToPC(oPC, "Alignments:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Chaotic (!align_chaotic)");
    SendMessageToPC(oPC, "Good (!align_good)");
    SendMessageToPC(oPC, "Evil (!align_evil)");
    SendMessageToPC(oPC, "Lawful (!align_lawful)");
    SendMessageToPC(oPC, "Neutral (!align_neutral)");
}

// List all Wings Commands
void ChatListWings(object oPC);
void ChatListWings(object oPC)
{
    SendMessageToPC(oPC, "Wings:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Angel (!w_ang)");
    SendMessageToPC(oPC, "Bat (!w_bat)");
    SendMessageToPC(oPC, "Bird (!w_bir)");
    SendMessageToPC(oPC, "Butterfly (!w_but)");
    SendMessageToPC(oPC, "Demon (!w_dem)");
    SendMessageToPC(oPC, "Dragon (!w_dra)");
    SendMessageToPC(oPC, "None (!w_non)");
}

// List all Tails Commands
void ChatListTails(object oPC);
void ChatListTails(object oPC)
{
    SendMessageToPC(oPC, "Tails:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Bone (!t_bon)");
    SendMessageToPC(oPC, "Devil (!t_dev)");
    SendMessageToPC(oPC, "Lizard (!t_liz)");
    SendMessageToPC(oPC, "None (!t_non)");
}

// List all Player Commands
void ChatListPlayer(object oPC);
void ChatListPlayer(object oPC)
{
    SendMessageToPC(oPC, "Player:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Legendary Level (!legend)");
    SendMessageToPC(oPC, "Looking For Group (!lfg)");
    SendMessageToPC(oPC, "Re-Equip (!re_equip)");
    SendMessageToPC(oPC, "Save (!save)");
    SendMessageToPC(oPC, "Re-Level (!relevel)");
    SendMessageToPC(oPC, "Re-Build all Levels (!rebuild)");
    SendMessageToPC(oPC, "Server (!server)");
    SendMessageToPC(oPC, "PvP (!pvp)");
    SendMessageToPC(oPC, "Bounties (!bounties)");
    SendMessageToPC(oPC, "Status: Like (!like)");
    SendMessageToPC(oPC, "Status: Dislike (!dislike)");
    SendMessageToPC(oPC, "Portrait (!portrait)");
    SendMessageToPC(oPC, "Voice (!voice)");
    SendMessageToPC(oPC, "Skin (!skin)");
    SendMessageToPC(oPC, "Hair (!hair)");
}

// List all Eyes Commands
void ChatListEyes(object oPC);
void ChatListEyes(object oPC)
{
    SendMessageToPC(oPC, "Eyes:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Cyan (!eyec)");
    SendMessageToPC(oPC, "Green (!eyeg)");
    SendMessageToPC(oPC, "None (!eyen)");
    SendMessageToPC(oPC, "Orange (!eyeo)");
    SendMessageToPC(oPC, "Purple (!eyep)");
    SendMessageToPC(oPC, "Red Flame (!eyer)");
    SendMessageToPC(oPC, "White (!eyew)");
    SendMessageToPC(oPC, "Yellow: Like (!eyew)");
}

// List all Head Commands
void ChatListHead(object oPC);
void ChatListHead(object oPC)
{
    SendMessageToPC(oPC, "Heads:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Next (!headn)");
    SendMessageToPC(oPC, "Previous (!headp)");
}

// List all Arm Commands
void ChatListArm(object oPC);
void ChatListArm(object oPC)
{
    SendMessageToPC(oPC, "Arms:");

    SendMessageToPC(oPC, MESSAGETHREE + MESSAGETWO + MESSAGEONE);

    SendMessageToPC(oPC, " ");

    SendMessageToPC(oPC, "Bone (!armb)");
    SendMessageToPC(oPC, "Normal (!armn)");
}


//void main(){}
