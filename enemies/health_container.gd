class_name HealthContainer extends Area3D


@export var health := 10.0


func damage(damage: float):
	health -= damage
	if health <= 0:
		owner.queue_free()
