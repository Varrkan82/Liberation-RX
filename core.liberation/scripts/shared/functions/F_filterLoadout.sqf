params [ "_unit" ];

if (!GRLIB_limited_arsenal) exitWith {};

{
    if (_x in ([handgunWeapon _unit])) then {_unit removeWeapon _x};
    if (_x in ([primaryWeapon _unit])) then {_unit removeWeapon _x};
    if (_x in ([secondaryWeapon _unit])) then {_unit removeWeapon _x};
    if (_x in ([uniform _unit])) then {removeUniform _unit};
    if (_x in ([vest _unit])) then {removeVest _unit};
    if (_x in ([headgear _unit])) then {removeHeadgear _unit};
    if (_x in ([backpack _unit])) then {removeBackpack _unit};
    if (_x in ([binocular _unit])) then {_unit removeWeapon _x};
    if (_x in ([hmd _unit])) then {_unit unassignItem _x; _unit removeItem  _x};
    if (_x in (primaryWeaponItems _unit)) then {_unit removePrimaryWeaponItem _x};
    if (_x in ((vestItems _unit)+(uniformItems _unit)+(backpackItems _unit)+(items _unit))) then {_unit removeItems _x};
} forEach GRLIB_blacklisted_from_arsenal;

if (!isNil "GRLIB_MOD_signature") then {
    if (str [handgunWeapon _unit] find GRLIB_MOD_signature < 0) then {_unit removeWeapon (handgunWeapon _unit)};
    if (str [primaryWeapon _unit] find GRLIB_MOD_signature < 0) then {_unit removeWeapon (primaryWeapon _unit)};
    if (str [secondaryWeapon _unit] find GRLIB_MOD_signature < 0) then {_unit removeWeapon (secondaryWeapon _unit)};
    if (str [uniform _unit] find GRLIB_MOD_signature < 0) then {removeUniform _unit};
    if (str [vest _unit] find GRLIB_MOD_signature < 0) then {removeVest _unit};
    if (str [headgear _unit] find GRLIB_MOD_signature < 0) then {removeHeadgear _unit};
    if (str [backpack _unit] find GRLIB_MOD_signature < 0) then {removeBackpack _unit};
    if (str [binocular _unit] find GRLIB_MOD_signature < 0) then {_unit removeWeapon (binocular _unit)};
    if (str [hmd _unit] find GRLIB_MOD_signature < 0) then {_unit unassignItem (hmd _unit); _unit removeItem (hmd _unit)};
    { if (str _x find GRLIB_MOD_signature < 0) then {_unit removePrimaryWeaponItem _x} } forEach primaryWeaponItems _unit;
    { if (str _x find GRLIB_MOD_signature < 0) then {_unit removeItems _x} } forEach ((vestItems _unit)+(uniformItems _unit)+(backpackItems _unit)+(items _unit));
};
[_unit] call F_correctLaserBatteries;
[_unit] call F_correctHEGL;