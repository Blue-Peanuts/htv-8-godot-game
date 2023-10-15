class_name WeaponData extends Node


@export var sprites: Array[Sprite2D]


@export var current_id := 0


func _ready() -> void:
	switch_weapon(current_id)


func switch_weapon(id: int):
	sprites[current_id].visible = false
	current_id = id
	if current_id != 0:
		sprites[current_id].visible = true
