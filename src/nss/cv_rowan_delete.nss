//////////////////////////////////////////////////
#include "nwnx_admin"
void main()
{
    PlayVoiceChat(VOICE_CHAT_GOODBYE, OBJECT_SELF);
    DelayCommand(3.0, NWNX_Administration_DeletePlayerCharacter(GetPCSpeaker(), FALSE));
}
