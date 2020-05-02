void RespawnObject(string sTag, int iType, location lLoc)
{
    CreateObject(iType, GetStringLowerCase(GetStringLeft(sTag, 16)), lLoc);
}


//void main(){}
