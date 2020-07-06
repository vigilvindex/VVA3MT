/*
 * hqs_mhq.sqf
 * This script checks player side and sends them to their MHQ if it is available.
 */
/*
private["_caller","_callerOrigPos","_callerCurrPos"];
_caller = _this select 1;
if ((side _caller) == west) then {
    if (alive w_mhq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo w_mhq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver w_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner w_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander w_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret w_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Mobile HQ is full.\n";};
    }else{
        hint "Mobile HQ is unavailable.\n";
    };
};
if ((side _caller) == east) then {
    if (alive e_mhq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo e_mhq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver e_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner e_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander e_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret e_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Mobile HQ is full.\n";};
    }else{
        hint "Mobile HQ is unavailable.\n";
    };
};
if ((side _caller) == resistance) then {
    if (alive g_mhq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo g_mhq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver g_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner g_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander g_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret g_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Mobile HQ is full.\n";};
    }else{
        hint "Mobile HQ is unavailable.\n";
    };
};
if ((side _caller) == civilian) then {
    if (alive c_mhq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo c_mhq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver c_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner c_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander c_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret c_mhq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Mobile HQ is full.\n";};
    }else{
        hint "Mobile HQ is unavailable.\n";
    };
};
*/
