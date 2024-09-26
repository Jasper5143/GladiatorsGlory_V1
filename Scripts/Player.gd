extends CharacterBody2D

# Variables
@onready var cooldown_amina = preload("res://Prefabs/attack_cooldown_anim.tscn")
@onready var sword_prefab = preload("res://Prefabs/sword.tscn")
@onready var camera = $Camera2D
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 300.0
const JUMP_VELOCITY = -700.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var attacking = false
var cooldown_anim_prefab = null  # Declare a class variable for cooldown animation

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Adds variable jump height
	if Input.is_action_just_released("Jump"):
		jump_cut()

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	# Walk animation
	if velocity.x == 300 or velocity.x == -300:
		anim.play("Running")
	else:
		anim.play("Idle")
	if attacking == true:
		anim.play("attack")
		
	if velocity.x == 300:
		anim.flip_h = false
	if velocity.x == -300:
		anim.flip_h = true

# Managed sword attack and cooldown animation update
func _process(delta):
	# Check for sword attacks
	if Input.is_action_just_pressed("attack_right") and attacking == false:
		var sword = sword_prefab.instantiate()
		sword.position = position
		get_parent().add_child(sword)
		attacking = true
		cooldown_anim()
		await get_tree().create_timer(0.5).timeout
		attacking = false

	if Input.is_action_just_pressed("attack_left") and attacking == false:
		var sword = sword_prefab.instantiate()
		sword.position = position
		sword.position.x -= 1
		sword.scale.x = -1.000001
		get_parent().add_child(sword)
		attacking = true
		cooldown_anim()
		await get_tree().create_timer(0.5).timeout
		attacking = false

	if Input.is_action_just_pressed("attack_up") and attacking == false:
		var sword = sword_prefab.instantiate()
		sword.position = position
		sword.position.x -= 1
		sword.scale.x = -1
		get_parent().add_child(sword)
		attacking = true
		cooldown_anim()
		await get_tree().create_timer(0.5).timeout
		attacking = false

	# Update cooldown animation position if it exists
	if cooldown_anim_prefab != null:
		cooldown_anim_prefab.position = position  # Continuously update its position to follow the player

# Spawn cooldown animation
func cooldown_anim():
	cooldown_anim_prefab = cooldown_amina.instantiate()  # Store reference to the prefab
	get_parent().add_child(cooldown_anim_prefab)  # Add to the same parent as the player

# Stops the jump when up is released
func jump_cut():
	if velocity.y < 0:
		velocity.y *= 0.2

	
