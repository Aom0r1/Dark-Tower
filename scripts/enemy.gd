extends CharacterBody2D
@export var speed = 250
@onready var character = get_tree().get_first_node_in_group("Knight")
@export var max_hp = 200
var hp = max_hp
var hit = false
var dmg = 5
func _physics_process(delta):
	if character:   
		var direction = position.direction_to(character.global_position).normalized()
		velocity = direction * speed
		move_and_slide()
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
func attack(character):
	character.take_damage(dmg)
func _on_area_2d_area_entered(area):
	if hit == false: 
		$Timer.start()
		hit = true

func _on_timer_timeout():
	attack(character)
	hit = false
