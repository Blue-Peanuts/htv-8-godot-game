class_name PlayerWalkDirectionController extends DirectionController


func _get_target_direction() -> Vector3:
	var vec2 := Input.get_vector("LEFT","RIGHT", "UP", "DOWN")
	return Vector3(vec2.x, 0, vec2.y)
