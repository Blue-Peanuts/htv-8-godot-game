class_name StateConditionInvert extends StateCondition


func _is_true():
	for child in get_children():
		var condition := child as StateCondition
		if condition.is_true():
			return false
	return true
