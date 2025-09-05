extends ProgressBar

@onready var characterbar = get_tree().get_first_node_in_group("Knight")

func _ready() -> void:
	max_value = characterbar.hp
	
func _process(delta: float) -> void:
	value = characterbar.hp
