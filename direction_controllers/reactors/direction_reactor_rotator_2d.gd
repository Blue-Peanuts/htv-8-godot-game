class_name DirectionReactorRotator2D extends DirectionReactor


@onready var target := get_parent()


func _update_visuals(direction: Vector3):
	
	if target.global_scale.y < 0: # limitation of negative x scale in node2d
		direction.x *= -1
	var angle = atan2(direction.z, direction.x)
	target.rotation = angle