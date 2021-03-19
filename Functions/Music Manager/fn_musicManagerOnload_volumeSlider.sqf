/* ----------------------------------------------------------------------------
Function: BLWK_fnc_musicManagerOnLoad_volumeSlider

Description:
	Adds (seeking) functionality to the volume slider in the Music Manager.

Parameters:
	0: _control : <CONTROL> - The control for the volume slidier

Returns:
	NOTHING

Examples:
    (begin example)
		[_control] call BLWK_fnc_musicManagerOnLoad_volumeSlider;
    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
#define SCRIPT_NAME "BLWK_fnc_musicManagerOnLoad_volumeSlider"
disableSerialization;
scriptName SCRIPT_NAME;

params ["_control"];

_control sliderSetPosition (musicVolume);

_control ctrlAddEventHandler ["sliderPosChanged",{
	_this spawn {
		params ["_control", "_newValue"];
		0.1 fadeMusic _newValue;
	};
}];