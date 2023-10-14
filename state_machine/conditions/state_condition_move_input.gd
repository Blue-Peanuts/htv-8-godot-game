class_name StateConditionMoveInput extends StateCondition


func _is_true():
	return PlayerMovementInput.get_input() != Vector3.ZERO
