class_name StateConditionKeyPress extends StateCondition

enum PressType {
	PRESSED,
	JUST_PRESSED,
	JUST_RELEASED
}

@export var action_string: String
@export var press_type: PressType


func _is_true() -> bool:
	if press_type == PressType.PRESSED:
		return Input.is_action_pressed(action_string)
	if press_type == PressType.JUST_PRESSED:
		return Input.is_action_just_pressed(action_string)
	if press_type == PressType.JUST_RELEASED:
		return Input.is_action_just_released(action_string)
	return false
