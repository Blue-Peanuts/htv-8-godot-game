@tool
class_name DirectionReactorOffsetter2D extends DirectionReactor


@export var distance := Vector2(20,20)

@onready var target : Node2D = get_parent()
@onready var original_position := target.position


func _update(direction: Vector3):
	if target.global_scale.y < 0: # limitation of negative x scale in node2d
		direction.x *= -1
	target.position = original_position + Vector2(direction.x * distance.x, direction.z * distance.y)
