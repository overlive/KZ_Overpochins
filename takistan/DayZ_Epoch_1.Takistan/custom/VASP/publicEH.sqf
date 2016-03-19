//Client only
if (!isDedicated) then {
	"PVDZE_plr_SetDate"		addPublicVariableEventHandler {if (!(player getVariable["Preview",false])) then {setDate (_this select 1);};};
};
