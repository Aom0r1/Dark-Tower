extends CharacterBody2D
@export var speed = 500
@export var max_hp = 100
@export var basic_dmg = 15
@export var sword_path = preload("res://scenes/weapons/sword.tscn")
var hp = max_hp
var enemy_in_range: Node2D = null
var attack_cooldown = false
func sword_attack(area: Area2D):
	var sword = sword_path.instantiate()
	sword.global_position = global_position
	sword.look_at(area.global_position)
	get_parent().add_child(sword)
	
func _on_area_2d_2_area_entered(area):
	if area.name == "enemy":
		enemy_in_range = area
		print("Rodip")

func _on_area_2d_2_area_exited(area):
	if area == enemy_in_range:
		enemy_in_range = null
		
func _physics_process(delta):
	move()
	move_and_slide()
	print(hp)
	if attack_cooldown == false and enemy_in_range and Input.is_action_pressed("ui_lmb"):
		$Timer.start()
		attack_cooldown = true
		
func take_damage(amount: int):
	hp -= amount
	if hp <= 0:
		hp = 0
		queue_free()
		
func move():
	velocity = Vector2(
	Input.get_axis("ui_left", "ui_right"),
	Input.get_axis("ui_up", "ui_down")).normalized() * speed
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true 
		$AnimatedSprite2D.play("walk") 
	elif velocity.y:
		$AnimatedSprite2D.play("walk")	
	else : $AnimatedSprite2D.play("idle")


func _on_timer_timeout() -> void:
	attack_cooldown = false
	if enemy_in_range == null:
		return
	sword_attack(enemy_in_range)
	
	
