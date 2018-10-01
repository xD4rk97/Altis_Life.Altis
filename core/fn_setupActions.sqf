/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/

life_actions = [];

switch (playerSide) do {

    //Civilian
    case civilian: {
        //Drop fishing net
        life_actions pushBack (player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);

life_actions pushBack (player addAction["<t color='#0099FF'>Siediti</t>",{[cursorObject,player] execVM "sitdown.sqf"},true,1,true,true,"""",'player distance cursorObject < 3 && {([str cursorObject,"bench"] call KRON_StrInStr || [str cursorObject,"chair"] call KRON_StrInStr)} ']);
        //Rob person
        life_actions pushBack (player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']);
    };

    //Cops
    case west: {
    life_actions pushBack (player addAction["<t color='#0099FF'>Siediti</t>",{[cursorObject,player] execVM "sitdown.sqf"},true,1,true,true,"""",'player distance cursorObject < 3 && {([str cursorObject,"bench"] call KRON_StrInStr || [str cursorObject,"chair"] call KRON_StrInStr)} ']);
    };

    //EMS
    case independent: {
life_actions pushBack (player addAction["<t color='#0099FF'>Siediti</t>",{[cursorObject,player] execVM "sitdown.sqf"},true,1,true,true,"""",'player distance cursorObject < 3 && {([str cursorObject,"bench"] call KRON_StrInStr || [str cursorObject,"chair"] call KRON_StrInStr)} ']); 
     };

};
