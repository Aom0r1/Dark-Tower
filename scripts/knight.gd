extends CharacterBody2D
@export var speed = 500
@export var max_hp = 100
@export var basic_dmg = 15
@export var sword_Path = preload("res://scenes/weapons/sword.tscn")
var hp = max_hp
func attack ():
	var sword = sword_Path.instantiate()
	sword.position = position
	sword.look_at()
	get_parent().add_child(sword)
func _on_area_2d_2_area_entered(area):
	if area.name == "enemy": 
		attack()
		print("vanuh")
func _physics_process(delta):
	move()
	move_and_slide()
	print(hp)
func take_damage(amount: int):
	hp -= amount
	if hp <= 0:
		hp = 0
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
