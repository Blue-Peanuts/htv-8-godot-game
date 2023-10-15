class_name StateConditionTimePassed extends StateCondition


@export var time: float


func _is_true() -> bool:
	return get_state().time_elapsed >= time
