class_name DirectionReactorFlatRotator3D extends DirectionReactor

@onready var target : Node3D = get_parent()


func _update(direction: Vector3):
	var angle = atan2(direction.z, direction.x)
	target.rotation.y = -angle
