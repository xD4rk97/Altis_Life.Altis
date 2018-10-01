/*
    File: init.sqf
    Author:

    Description:

*/
StartProgress = false;

if(isDedicated && isNil("life_market_prices")) then
{
[] call life_fnc_marketconfiguration;
diag_log "Market prices generated!";

"life_market_prices" addPublicVariableEventHandler
{
diag_log format["Market prices updated! %1", _this select 1];
};

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;

};

//Start server fsm
[] execFSM "core\fsm\server.fsm";
diag_log "Server FSM executed";
};

if (hasInterface) then {
   [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";

StartProgress = true;
