/*
 * hqs_ahq.sqf
 * This script checks player side and sends them to their AHQ if it is available.
 */
/*
private["_caller","_callerOrigPos","_callerCurrPos"];
_caller = _this select 1;
if ((side _caller) == west) then {
    if (alive w_ahq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo w_ahq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver w_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner w_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander w_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret w_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Aerial HQ is full.\n";};
    }else{
        hint "Aerial HQ is unavailable.\n";
    };
};
if ((side _caller) == east) then {
    if (alive e_ahq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo e_ahq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver e_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner e_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander e_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret e_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Aerial HQ is full.\n";};
    }else{
        hint "Aerial HQ is unavailable.\n";
    };
};
if ((side _caller) == resistance) then {
    if (alive g_ahq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo g_ahq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver g_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner g_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander g_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret g_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Aerial HQ is full.\n";};
    }else{
        hint "Aerial HQ is unavailable.\n";
    };
};
if ((side _caller) == civilian) then {
    if (alive c_ahq) then {
        _callerOrigPos = getPos _caller;
        _caller moveInCargo c_ahq; _callerCurrPos = getPos _caller;
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInDriver c_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInGunner c_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInCommander c_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {_caller moveInTurret c_ahq; _callerCurrPos = getPos _caller;};
        if (((_callerCurrPos select 0)==(_callerOrigPos select 0))&&((_callerCurrPos select 1)==(_callerOrigPos select 1))&&((_callerCurrPos select 2)==(_callerOrigPos select 2))) then {hint "Aerial HQ is full.\n";};
    }else{
        hint "Aerial HQ is unavailable.\n";
    };
};
*/
