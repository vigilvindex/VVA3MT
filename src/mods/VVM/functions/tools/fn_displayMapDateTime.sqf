_date = date;
_year = format ["%3-%2-%1",_date select 0,(if (_date select 1 < 10) then {"0"} else {""}) + str (_date select 1),(if (_date select 2 < 10) then {"0"} else {""}) + str (_date select 2)];
_time = format ["%1:%2",(if (_date select 3 < 10) then {"0"} else {""}) + str (_date select 3),(if (_date select 4 < 10) then {"0"} else {""}) + str (_date select 4)];
[[worldName,2,1],[_year,2,1],[_time,2,1,2]] spawn BIS_fnc_EXP_camp_SITREP;