@tool
class_name FlipperDirectionReactor extends DirectionReactor


@onready var target := get_parent()


func _update_visuals(direction: Vector3):
	if direction.x >= 0:
		target.scale.x = abs(target.scale.x)
	else:
		target.scale.x = -abs(target.scale.x)
