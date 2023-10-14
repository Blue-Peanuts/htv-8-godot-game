class_name StateMoveTowardsDirection extends StateBehaviour

@export var direction_controller: DirectionController
@onready var movement = Movement.get_movement(self)

func _active_physics_process(delta):
	movement.set_move(direction_controller.direction)


func _on_leave():
	movement.set_move(Vector3.ZERO)
