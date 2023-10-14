extends Node


func get_look_direction() -> Vector3:
	return (get_mouse_position() - owner.position).normalized()


func get_mouse_position() -> Vector3:
	var camera := get_viewport().get_camera_3d()
	var position2D := get_viewport().get_mouse_position()
	var plane := Plane(Vector3(0, 1, 0), owner.position)
	var position3D = plane.intersects_ray(
		camera.project_ray_origin(position2D),
		camera.project_ray_normal(position2D))
	if position3D == null:
		return Vector3.ZERO
	return position3D
