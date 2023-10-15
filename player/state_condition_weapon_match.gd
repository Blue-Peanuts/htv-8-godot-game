class_name StateConditionWeaponMatch extends StateCondition


@onready var weapon_data: WeaponData = $"../../../../WeaponData"
@export var weapon_id: int

func _is_true():
	print( weapon_data.current_id == weapon_id)
	return weapon_data.current_id == weapon_id
