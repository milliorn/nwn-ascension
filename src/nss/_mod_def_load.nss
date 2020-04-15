//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 27, 2020
//::
//:://////////////////////////////////////////////
#include "inc_discord"
#include "nwnx_admin"
#include "nwnx_area"
#include "nwnx_chat"
#include "nwnx_events"
#include "nwnx_weapon"
#include "nwnx_time"

void main()
{
    object oArea, oMod = GetModule();

    //  NWNXEE Events
    NWNX_Administration_SetPlayOption(NWNX_ADMINISTRATION_OPTION_RESTORE_SPELLS_USES, TRUE);

    NWNX_Chat_RegisterChatScript("nwnx_chat_event");

    NWNX_Events_SubscribeEvent("NWNX_ON_DM_CHANGE_DIFFICULTY_AFTER", "on_dm_chng_dif_a");

    NWNX_Events_SubscribeEvent("NWNX_ON_DM_GIVE_GOLD_AFTER", "on_dm_give_gp_af");
    NWNX_Events_SubscribeEvent("NWNX_ON_DM_GIVE_ITEM_AFTER", "on_dm_give_itm_a");
    NWNX_Events_SubscribeEvent("NWNX_ON_DM_GIVE_LEVEL_AFTER", "on_dm_give_lvl_a");
    NWNX_Events_SubscribeEvent("NWNX_ON_DM_GIVE_XP_AFTER", "on_dm_give_xp_af");

    NWNX_Events_SubscribeEvent("NWNX_ON_DM_SPAWN_OBJECT_AFTER", "on_dm_spwn_obj_a");

    NWNX_Events_SubscribeEvent("NWNX_ON_ENTER_STEALTH_BEFORE", "on_en_stealth_be");
    NWNX_Events_SubscribeEvent("NWNX_ON_EXIT_STEALTH_AFTER", "on_ex_stealth_af");

    NWNX_Events_SubscribeEvent("NWNX_ON_EXAMINE_OBJECT_BEFORE", "on_exam_obj_befo");

    NWNX_Events_SubscribeEvent("NWNX_ON_USE_FEAT_AFTER", "on_use_feat_after");
    NWNX_Events_SubscribeEvent("NWNX_ON_USE_FEAT_BEFORE", "on_use_feat_befo");

    NWNX_Events_SubscribeEvent("NWNX_ON_USE_SKILL_AFTER", "on_use_skill_aft");
    NWNX_Events_SubscribeEvent("NWNX_ON_USE_SKILL_BEFORE", "on_use_skill_bef");

    NWNX_Events_SubscribeEvent("NWNX_ON_WEBHOOK_FAILED", "on_webhook_faile");

    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_HANDAXE);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_LIGHTHAMMER);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_LIGHTMACE);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_SICKLE);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_DART);
    NWNX_Weapon_SetWeaponUnarmed(BASE_ITEM_DART);
    NWNX_Weapon_SetWeaponUnarmed(BASE_ITEM_SHURIKEN);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_SHURIKEN);
    NWNX_Weapon_SetWeaponIsMonkWeapon(BASE_ITEM_QUARTERSTAFF);

    //  Create a Module Wide Dynamic Weather/Fog/Skybox system
    oArea = GetFirstArea();
    while (GetIsObjectValid(oArea))
    {
        if (!GetIsAreaInterior(oArea))
        {
            SetFogAmount(FOG_TYPE_ALL, d2(), oArea);

            switch (Random(16))
            {
                case 0:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLACK, oArea);
                    break;
                case 1:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE, oArea);
                    break;
                case 2:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BLUE_DARK, oArea);
                    break;
                case 3:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN, oArea);
                    break;
                case 4:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_BROWN_DARK, oArea);
                    break;
                case 5:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_CYAN, oArea);
                    break;
                case 6:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN, oArea);
                    break;
                case 7:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREEN_DARK, oArea);
                    break;
                case 8:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_GREY, oArea);
                    break;
                case 9:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_MAGENTA, oArea);
                    break;
                case 10:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE, oArea);
                    break;
                case 11:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_ORANGE_DARK, oArea);
                    break;
                case 12:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED, oArea);
                    break;
                case 13:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_RED_DARK, oArea);
                    break;
                case 14:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_WHITE, oArea);
                    break;
                case 15:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW, oArea);
                    break;
                case 16:
                    SetFogColor(FOG_TYPE_ALL, FOG_COLOR_YELLOW_DARK, oArea);
                    break;
            }

            switch (Random(16))
            {
                case 0:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_BLACK);
                    break;
                case 1:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_BLUE);
                    break;
                case 2:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_BLUE_DARK);
                    break;
                case 3:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_BROWN);
                    break;
                case 4:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_BROWN_DARK);
                    break;
                case 5:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_CYAN);
                    break;
                case 6:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_GREEN);
                    break;
                case 7:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_GREEN_DARK);
                    break;
                case 8:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_GREY);
                    break;
                case 9:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_MAGENTA);
                    break;
                case 10:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_ORANGE);
                    break;
                case 11:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_ORANGE_DARK);
                    break;
                case 12:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_RED);
                    break;
                case 13:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_RED_DARK);
                    break;
                case 14:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_WHITE);
                    break;
                case 15:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_YELLOW);
                    break;
                case 16:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_AMBIENT, FOG_COLOR_YELLOW_DARK);
                    break;
            }

            switch (Random(16))
            {
                case 0:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_BLACK);
                    break;
                case 1:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_BLUE);
                    break;
                case 2:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_BLUE_DARK);
                    break;
                case 3:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_BROWN);
                    break;
                case 4:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_BROWN_DARK);
                    break;
                case 5:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_CYAN);
                    break;
                case 6:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_GREEN);
                    break;
                case 7:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_GREEN_DARK);
                    break;
                case 8:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_GREY);
                    break;
                case 9:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_MAGENTA);
                    break;
                case 10:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_ORANGE);
                    break;
                case 11:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_ORANGE_DARK);
                    break;
                case 12:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_RED);
                    break;
                case 13:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_RED_DARK);
                    break;
                case 14:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_WHITE);
                    break;
                case 15:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_YELLOW);
                    break;
                case 16:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_MOON_DIFFUSE, FOG_COLOR_YELLOW_DARK);
                    break;
            }

            switch (Random(16))
            {
                case 0:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_BLACK);
                    break;
                case 1:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_BLUE);
                    break;
                case 2:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_BLUE_DARK);
                    break;
                case 3:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_BROWN);
                    break;
                case 4:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_BROWN_DARK);
                    break;
                case 5:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_CYAN);
                    break;
                case 6:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_GREEN);
                    break;
                case 7:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_GREEN_DARK);
                    break;
                case 8:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_GREY);
                    break;
                case 9:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_MAGENTA);
                    break;
                case 10:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_ORANGE);
                    break;
                case 11:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_ORANGE_DARK);
                    break;
                case 12:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_RED);
                    break;
                case 13:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_RED_DARK);
                    break;
                case 14:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_WHITE);
                    break;
                case 15:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_YELLOW);
                    break;
                case 16:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_AMBIENT, FOG_COLOR_YELLOW_DARK);
                    break;
            }

            switch (Random(16))
            {
                case 0:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_BLACK);
                    break;
                case 1:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_BLUE);
                    break;
                case 2:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_BLUE_DARK);
                    break;
                case 3:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_BROWN);
                    break;
                case 4:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_BROWN_DARK);
                    break;
                case 5:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_CYAN);
                    break;
                case 6:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_GREEN);
                    break;
                case 7:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_GREEN_DARK);
                    break;
                case 8:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_GREY);
                    break;
                case 9:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_MAGENTA);
                    break;
                case 10:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_ORANGE);
                    break;
                case 11:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_ORANGE_DARK);
                    break;
                case 12:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_RED);
                    break;
                case 13:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_RED_DARK);
                    break;
                case 14:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_WHITE);
                    break;
                case 15:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_YELLOW);
                    break;
                case 16:
                    NWNX_Area_SetSunMoonColors(oArea, NWNX_AREA_COLOR_TYPE_SUN_DIFFUSE, FOG_COLOR_YELLOW_DARK);
                    break;
            }

            if (GetSkyBox(oArea) == SKYBOX_NONE)
            {
                switch (Random(4))
                {
                    case 0:
                        SetSkyBox(SKYBOX_DESERT_CLEAR, oArea);
                        break;
                    case 1:
                        SetSkyBox(SKYBOX_GRASS_CLEAR, oArea);
                        break;
                    case 2:
                        SetSkyBox(SKYBOX_GRASS_STORM, oArea);
                        SetWeather(oArea, WEATHER_RAIN);
                        break;
                    case 3:
                        SetSkyBox(SKYBOX_ICY, oArea);
                        SetWeather(oArea, WEATHER_SNOW);
                        break;
                    case 4:
                        SetSkyBox(SKYBOX_WINTER_CLEAR, oArea);
                        break;
                }
            }
        }

        NWNX_Area_SetWindPower(oArea, Random(2));

        oArea = GetNextArea();
    }

    SetWeather(GetAreaFromLocation(GetStartingLocation()), WEATHER_USE_AREA_SETTINGS);

    //  Set a var so that it can be compared in the "obj_sundial"
    int iRawBootTime = NWNX_Time_GetTimeStamp();
    string sBootTime = NWNX_Time_GetSystemTime();
    string sBootDate = NWNX_Time_GetSystemDate();
    SetLocalInt(oMod, "RAW_BOOT_TIME", iRawBootTime);
    SetLocalString(oMod, "BOOT_TIME", sBootTime);
    SetLocalString(oMod, "BOOT_DATE", sBootDate);

    //  Redis DB Var
    SetLocalString(GetModule(), "SAVE_REDIS", "FALSE");

    //  Make a note in Server log of when this script finishes and send a message
    //  to Discord that the module is loaded.
    ModLoadWebhook();

    //  Make all items in all stores marked as infinite if they are not infinite
    oArea = GetFirstArea();
    while (GetIsObjectValid(oArea))
    {
        object oObject = GetFirstObjectInArea(oArea);
        while (GetIsObjectValid(oObject))
        {
            if (GetObjectType(oObject) == OBJECT_TYPE_STORE)
            {
                object oItem = GetFirstItemInInventory(oObject);
                while (GetIsObjectValid(oItem))
                {
                    if (!GetInfiniteFlag(oItem))
                    {
                        SetInfiniteFlag(oItem);
                    }
                    oItem = GetNextItemInInventory(oObject);
                }
            }
            oObject = GetNextObjectInArea(oArea);
        }
        oArea = GetNextArea();
    }

    WriteTimestampedLogEntry("*** " + GetModuleName() + " - SERVER LOADED***");

    ExecuteScript("x3_mod_def_load", OBJECT_SELF);
}
