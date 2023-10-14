@tool
class_name FlipperDirectionReactor extends DirectionReactor


@onready var target : Node2D = get_parent()


func _update(direction: Vector3):
	if direction.x >= 0:
		target.scale.x = abs(target.scale.x)
	else:
		target.scale.x = -abs(target.scale.x)
