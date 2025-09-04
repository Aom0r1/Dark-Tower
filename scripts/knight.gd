extends CharacterBody2D
@export var speed = 500
func _physics_process(delta):
	move()
	move_and_slide()
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
