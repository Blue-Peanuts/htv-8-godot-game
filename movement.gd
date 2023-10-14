class_name Movement extends Node

var _move_vec := Vector3.ZERO
@onready var _owner := get_owner() as CharacterBody3D
@export var speed := 10


func set_move(dir: Vector3):
	_move_vec = dir


func _physics_process(_delta):
	_owner.velocity = _move_vec * speed
	_owner.move_and_slide()


static func get_movement(node: Node) -> Movement:
	return NodeUtil.find_relative(node, func(n): return n is Movement)
