# VVLO - VigilVindex's Load Outs Module

## DESCRIPTION

Functions to set a load out of gear for a crate, unit or vehicle.

## LICENCE

[CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/)

## AUTHORS

* [VigilVindex](mailto:vigil.vindex@gmail.com)

## Usage

```sqf
_result = [_unit,_side,_faction,_role] call VVLO_fnc_createLoadout;
_result = [_unit,_side,_faction,_role,_primary,_secondary,_launcher] call VVLO_fnc_createLoadout;
```

## TODO

* Player UUID specific loadouts.
* Deduplicate classname usage.
* Isolated side & faction agnostic gear.
* Support Vanilla, DLC, CUP, RHS, BAF, CFP, ACE, TFAR, ACRE.
* Environmental Uniforms: ARID: BROWN, ARTIC: WHITE, LUSH: GREEN, STEALTH: BLACK, MARINE: BLUE

## Functions

* Create A Loadout For A Crate.
* Create A Loadout For A Unit.
* Create A Loadout For A Vehicle.

## Arguments (NAME OPTIONS)

* SIDES (EAST / WEST)
* EAST FACTIONS (CSAT,CSAT Pacific)
* WEST FACTIONS (US,CTRG)
* INDY FACTIONS (AAF,FIA)
* ROLE

## WEAPON ATTACHMENTS

* RAIL (IR / FLASH)
* OPTIC (Infantry, Support, Marksman, Sniper)
* MUZZLE (FLASH / SOUND)
* BIPOD

## EQUIPMENT

* NVGS
* TERMINAL
* BINOCULARS
* MAP
* COMPASS
* WATCH

## WEAPONS

* Primary
* Secondary
* Launchers

## MAGAZINES

* GRENADES
* MINES
* EXPLOSIVES

## ROLES (TAG - DESCRIPTION)

* CO - Commander
* SL - Squad Leader
* FTL - Fire Team Leader
* R - Rifleman
* RAT - Rifleman (AT)
* GRE - Grenadier
* AR - Automatic Rifleman
* AAR - Assistant Automatic Rifleman
* MMG - Medium MG Gunner
* MMGA - Medium MG Assistant
* HMG - Heavy MG Gunner (Deployable)
* HMGA - Heavy MG Assistant (Deployable)
* MAT - Medium AT Gunner
* MATA - Medium AT Assistant
* HAT - Heavy AT Gunner (Deployable)
* HATA - Heavy AT Assistant (Deployable)
* MRT - Mortar Gunner (Deployable)
* MRTA - Mortar Assistant (Deployable)
* MSAM - Medium SAM Gunner
* MSAMA - Medium SAM Assistant Gunner
* HSAM - Heavy SAM Gunner (Deployable)
* HSAMA - Heavy SAM Assistant Gunner (Deployable)
* DM - Designated Marksman
* SN - Sniper
* SP - Spotter
* MED - Medic
* ENG - Engineer (Demo)
* ENGM - Engineer (Mines)
* EOD - Explosive Ordinance & Demolitions
* UAV - UAV Operator
* DIV - Divers
* CAR - Carabineer
* SMG - SubMachine Gunner
* VC - Vehicle Commander
* VG - Vehicle Gunner
* VD - Vehicle Driver (Repair)
* PP - Air Vehicle Pilot / Co-Pilot
* PCC - Air Vehicle Co-Pilot (Repair) / Crew Chief (Repair)
* PC - Air Vehicle Crew
