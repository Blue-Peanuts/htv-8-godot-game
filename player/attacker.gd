extends StateBehaviour

@export var damage: float = 1
@export var area_3d: Area3D
@export var knock: float
@export var aim_direction: DirectionController

func _on_enter():
	Movement.get_movement(self).knock(aim_direction.direction * knock)
	for area in area_3d.get_overlapping_areas():
		if area is HealthContainer and area.owner != owner:
			area.damage(damage)
