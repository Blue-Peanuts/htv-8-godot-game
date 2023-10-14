class_name StateConditionTargetDirectionIsZero extends StateCondition

@export var direction_controller: DirectionController

func _is_true() -> bool:
	return direction_controller.get_target_direction().length() == 0
