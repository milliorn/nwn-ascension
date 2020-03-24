//:://////////////////////////////////////////////
//::
//:: Created By: Scott Milliorn
//:: Created On: March 22, 2020
//::
//:://////////////////////////////////////////////

/*
RED     700
PINK    755
ROSE    744
ORANGE  073
YELLOW  770
GREEN   070
BLUE    007
PURPLE  707
BLACK   000
WHITE   777
*/

#include "x3_inc_string"

void main()
{
    object oPC = GetLastUsedBy();

    int i = StringToInt(GetName(OBJECT_SELF));
    int j = i + 77;

    for (i; i <= j; ++i)
    {
        string sName = IntToString(i);
        SpeakString(StringToRGBString(sName, sName));

        switch (i)
        {
        case 107:
        case 117:
        case 127:
        case 137:
        case 147:
        case 157:
        case 167:
            i += 2;
            break;
        case 177:
            i = 199;
            break;
        case 207:
        case 217:
        case 227:
        case 237:
        case 247:
        case 257:
        case 267:
            i += 2;
            break;
        case 277:
            i = 299;
            break;
        case 307:
        case 317:
        case 327:
        case 337:
        case 347:
        case 357:
        case 367:
            i += 2;
            break;
        case 377:
            i = 399;
            break;
        case 407:
        case 417:
        case 427:
        case 437:
        case 447:
        case 457:
        case 467:
            i += 2;
            break;
        case 477:
            i = 499;
            break;
        case 507:
        case 517:
        case 527:
        case 537:
        case 547:
        case 557:
        case 567:
            i += 2;
            break;
        case 577:
            i = 599;
            break;
        case 607:
        case 617:
        case 627:
        case 637:
        case 647:
        case 657:
        case 667:
            i += 2;
            break;
        case 677:
            i = 699;
            break;
        case 707:
        case 717:
        case 727:
        case 737:
        case 747:
        case 757:
        case 767:
            i += 2;
            break;
        }
    }
}
