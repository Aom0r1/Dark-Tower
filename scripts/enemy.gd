extends CharacterBody2D

@export var speed: int = 250
@export var max_hp: int = 200
@export var dmg: int = 5

@onready var character = get_tree().get_first_node_in_group("Knight")

var hp: int
var hit: bool = false

func _ready() -> void:
	hp = max_hp

func _physics_process(delta: float) -> void:
	print("enemy: ",hp)
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

func _on_area_2d_area_entered(area: Area2D) -> void:
	var body = area.get_parent()
	if not hit and body.is_in_group("Knight"):
		print("hitler")
		character = body
		$Timer.start()
		hit = true

func _on_timer_timeout() -> void:
	attack(character)
	hit = false

func take_damage(amount: int) -> void:
	hp -= amount
	if hp <= 0:
		hp = 0
		queue_free()
