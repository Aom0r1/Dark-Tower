extends CharacterBody2D

@export var speed = 300
var character = null

func _ready():
	character = get_node("res://scenes/characters/knight_1/knight.tscn")

func _physics_process(delta):
	if character:   
		var direction = (character.position - position).normalized()
		velocity = direction * speed
		move_and_slide()
