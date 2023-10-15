class_name Movement extends Node

var _move_vec := Vector3.ZERO
@onready var _owner := get_owner() as CharacterBody3D
@export var speed := 10


var knock_force := Vector3.ZERO


func knock(force: Vector3):
	knock_force += force


func set_move(dir: Vector3, speedMul := 1.0):
	_move_vec = dir * speedMul



func _physics_process(_delta):
	_owner.velocity = _move_vec * speed + knock_force
	knock_force = knock_force.move_toward(Vector3.ZERO, 50 * _delta)
	_owner.move_and_slide()


static func get_movement(node: Node) -> Movement:
	return NodeUtil.find_relative(node, func(n): return n is Movement)
