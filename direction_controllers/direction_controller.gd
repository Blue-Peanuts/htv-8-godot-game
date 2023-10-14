class_name DirectionController extends Node

signal updated


@export var turn_speed := 1


func get_target_direction() -> Vector3:
	return _get_target_direction()


func _get_target_direction() -> Vector3:
	push_error("unimplemented")
	return Vector3.RIGHT


@onready var direction: Vector3 = Vector3.LEFT:
	set(value):
		direction = value
		updated.emit(value)


func _process(delta):
	direction = RotateVector3Towards(direction, get_target_direction(),
			delta * turn_speed)


func snap():
	direction = get_target_direction()



static func RotateVector3Towards(va: Vector3, vb: Vector3, max_angle: float, alternate_cross:= Vector3.UP) -> Vector3:
	# normalise both vectors:
	var va_n = va.normalized()
	var vb_n = vb.normalized()

	# take the cross product and dot product
	var cross = va_n.cross(vb_n).normalized()
	if cross == Vector3.ZERO:
		cross = alternate_cross
	var dot = va_n.dot(vb_n)

	# acos(dot) gives you the angle (in radians) between the two vectors which you'll want to clamp to your maximum rotation (convert it to radians)
	var angle = clamp(acos(dot), -max_angle, max_angle)
	
	# and now you can rotate your original
	var result = va.rotated(cross, angle)
	return result
