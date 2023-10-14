@icon("res://state_machine/state_icon.svg")
class_name State extends Node

@export var tags: Array[String]

signal entered
signal left
signal ghost_processed
signal active_processed
signal physics_processed
signal keyframe_event

var time_elapsed: float = 0
var _state_event_index = 0


@onready var behaviours: Array[StateBehaviour] = build_behaviours() 
func build_behaviours():
	var temp := NodeUtil.find_all_children(self, func(n): return (n is StateBehaviour))
	var behaviours : Array[StateBehaviour] = []
	for b in behaviours:
		b.build(self)
	behaviours.assign(temp)
	return behaviours


func _process(delta):
	time_elapsed += delta
	if is_current_state():
		_active_process(delta)
		_try_transition()
	for behaviour in behaviours:
		behaviour._ghost_process(delta)
	ghost_processed.emit(delta)


func _physics_process(delta: float):
	if is_current_state():
		for behaviour in behaviours:
			behaviour._active_physics_process(delta)
		physics_processed.emit(delta)


func on_enter():
	print(self)
	_state_event_index = 0
	time_elapsed = 0
	for behaviour in behaviours:
		behaviour._on_enter()
	entered.emit()


func on_leave():
	for behaviour in behaviours:
		behaviour._on_leave()
	left.emit()


func get_state_machine() -> StateMachine:
	return NodeUtil.find_ancestor(self, func(n): return n is StateMachine) as StateMachine


func is_current_state():
	return get_state_machine().current_state == self


func is_tagged(tag: String) -> bool:
	return tags.has(tag)


func _active_process(delta):
	for behaviour in behaviours:
		behaviour._active_process(delta)
	active_processed.emit(delta)


func _try_transition():
	for child in NodeUtil.find_all_descendants(self, func(n):
			return n is StateTransition):
		if(!is_current_state()):
			return
		child.try_transition()


func can_enter():
	var state_enter_condition: StateEnterCondition
	state_enter_condition = NodeUtil.find_child(self, func(n):
			return n is StateEnterCondition)
	return state_enter_condition == null or state_enter_condition.can_enter()


func keyframe_event_step():
	for behaviour in behaviours:
		behaviour._key_frame_event_step(_state_event_index)
	keyframe_event.emit(_state_event_index)
	_state_event_index += 1
	
