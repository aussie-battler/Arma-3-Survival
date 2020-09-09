/* ----------------------------------------------------------------------------
Function: BLWK_fnc_addBuildableObjectActions

Description:
	Adds all the actions to an object in order to manipulate it in the world.

	Executed from ""

Parameters:
	0: _object : <OBJECT> - The object to add the actions to

Returns:
	BOOL

Examples:
    (begin example)

		[myObject] call BLWK_fnc_addBuildableObjectActions;

    (end)

Author:
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
if !(hasInterface) exitWith {false};

params [
	["_object",objNull,[objNull]]
];

if (isNull _object) exitWith {false};

// sell object
_object addAction [ 
	"<t color='#ff0000'>-- Sell Object Back --</t>",  
	{
		params ["_object","_caller"];
		[_object,_caller] call BLWK_fnc_sell;
	}, 
	nil, 
	90,  
	false,  
	false,  
	"true", 
	"!(_originalTarget getVariable ['BLWK_objectPickedUp',false])", 
	5 
];

// move up
_object addAction [ 
	"<t color='#00ffff'>-- Move Object Up --</t>",  
	{
		params ["_object","_caller"];
		[_object,_caller,true] call BLWK_fnc_moveUpOrDown;
	}, 
	nil, 
	95,  
	false,  
	false,  
	"true", 
	"!(_originalTarget getVariable ['BLWK_objectPickedUp',false])", 
	5 
];


// move down
_object addAction [ 
	"<t color='#00ff00'>-- Move Object Down --</t>",  
	{
		params ["_object","_caller"];
		[_object,_caller,false] call BLWK_fnc_moveUpOrDown;
	}, 
	nil, 
	94,  
	false,  
	false,  
	"true", 
	"!(_originalTarget getVariable ['BLWK_objectPickedUp',false])", 
	5 
];

// pick up
_object addAction [ 
	"<t color='#ffffff'>-- Pickup Object --</t>",  
	{
		params ["_object","_caller"];
		[_object,_caller] call BLWK_fnc_pickup;
	}, 
	nil, 
	100,  
	false,  
	false,  
	"true", 
	"!(_originalTarget getVariable ['BLWK_objectPickedUp',false])", 
	5 
];

// rotate left
_object addAction [
	"<t color='#ff00bf'>-- Rotate Object Left --</t>",
	{
		params ["_object"];

	},
	_object,
	92,
	false,  
	false,  
	"true", 
	"!(_originalTarget getVariable ['BLWK_objectPickedUp',false])", 
	5
];

// rotate right
_object addAction [
	"<t color='#7e33ff'>-- Rotate Object Right --</t>",
	{
		params ["_object"]

	},
	nil,
	93,
	false,  
	false,  
	"true", 
	"!(_originalTarget getVariable ['BLWK_objectPickedUp',false])", 
	5
];

// Reset Rotation
_object addAction [ 
	"<t color='#ffff00'>-- Reset Object Rotation --</t>",  
	{
		params ["_object"];
		
	}, 
	nil, 
	91,  
	false,  
	false,  
	"true", 
	"!(_originalTarget getVariable ['BLWK_objectPickedUp',false])", 
	5
];

true