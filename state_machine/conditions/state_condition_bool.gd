class_name StateConditionBool extends StateCondition

@export var can_transition: bool

func _is_true():
	return can_transition
