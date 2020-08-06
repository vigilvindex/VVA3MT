_fnc_getRandomWaterPos = {
    params["_obj"];
    _posFound = false;
    _randomPos = [];
    while {!_posFound} do
    {
        _distance = 300 + random 100;
        _dir = random 360;
        _randomPos = [_obj, _distance, _dir] call BIS_fnc_relPos;
        if (surfaceIsWater _randomPos) then
        {
            _posFound = true;
        };
    };
    _randomPos
};
