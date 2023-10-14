class_name PlayerWalkDirectionController extends DirectionController


func _get_target_direction() -> Vector3:
	var vec2 := Input.get_vector("ui_left","ui_right", "ui_up", "ui_down")
	return Vector3(vec2.x, 0, vec2.y)
