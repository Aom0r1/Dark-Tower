extends Area2D

var dmg: int = 20

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	await $AnimatedSprite2D.animation_finished
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	if area.name == "enemy":
		body.take_damage(dmg)
