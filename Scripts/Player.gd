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
var last_direction = Vector2.RIGHT  # Initialize with a default direction (facing right)
var sword_instance = null  # Declare a variable to hold the sword instance

# Offset values
var cooldown_offset_right = Vector2(30, -30)  # Offset for facing right
var cooldown_offset_left = Vector2(-30, -30)  # Offset for facing left

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
		if direction > 0:
			last_direction = Vector2.RIGHT  # Facing right
		else:
			last_direction = Vector2.LEFT  # Facing left
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

	# Flip character based on direction
	anim.flip_h = (last_direction == Vector2.LEFT)

	# Update sword position if it exists
	if sword_instance != null:
		sword_instance.position = position

# Managed sword attack and cooldown animation update
func _process(delta):
	# Check for sword attacks
	if Input.is_action_just_pressed("attack_right") and attacking == false:
		sword_instance = sword_prefab.instantiate()  # Instantiate the sword and store reference
		sword_instance.position = position  # Set its initial position to the player's position
		get_parent().add_child(sword_instance)  # Add to the same parent as the player
		attacking = true
		last_direction = Vector2.RIGHT  # Update last direction when attacking
		cooldown_anim()
		await get_tree().create_timer(0.5).timeout
		attacking = false

	if Input.is_action_just_pressed("attack_left") and attacking == false:
		sword_instance = sword_prefab.instantiate()  # Instantiate the sword and store reference
		sword_instance.position = position  # Set its initial position to the player's position
		sword_instance.position.x -= 1  # Adjust position for left attack
		sword_instance.scale.x = -1.000001  # Flip the sword for left direction
		get_parent().add_child(sword_instance)  # Add to the same parent as the player
		attacking = true
		last_direction = Vector2.LEFT  # Update last direction when attacking
		cooldown_anim()
		await get_tree().create_timer(0.5).timeout
		attacking = false

	# Update cooldown animation position if it exists
	if cooldown_anim_prefab != null:
		if last_direction == Vector2.RIGHT:  # Facing right
			cooldown_anim_prefab.position = position + cooldown_offset_right  # Apply right offset
		elif last_direction == Vector2.LEFT:  # Facing left
			cooldown_anim_prefab.position = position + cooldown_offset_left  # Apply left offset

# Spawn cooldown animation
func cooldown_anim():
	cooldown_anim_prefab = cooldown_amina.instantiate()  # Store reference to the prefab
	get_parent().add_child(cooldown_anim_prefab)  # Add to the same parent as the player

# Stops the jump when up is released
func jump_cut():
	if velocity.y < 0:
		velocity.y *= 0.2

