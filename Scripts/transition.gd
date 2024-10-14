extends ColorRect

@export var fade_duration: float = 2.0  # Duration of the fade effect in seconds

func _ready():
	# Set the initial state
	modulate.a = 0.0  # Fully transparent

func _process(delta: float) -> void:
	# You can add additional logic here if needed
	pass

func start_fade_in():
	# Call the fade-in effect
	fade_in()

func fade_in():
	var elapsed_time: float = 0.0  # Track the elapsed time

	while elapsed_time < fade_duration:
		elapsed_time += get_process_delta_time()  # Increment elapsed time
		modulate.a = elapsed_time / fade_duration  # Update alpha based on elapsed time
		modulate.a = clamp(modulate.a, 0.0, 1.0)  # Ensure alpha is between 0.0 and 1.0
		# Wait a bit for the next frame to smooth the transition
		await get_tree().create_timer(0.01).timeout

	# Optionally, you can make the ColorRect non-interactive after the fade
	set_process_input(false)  # Disable input processing after the fade completes

# This will ignore input events if fully transparent
func _input(event):
	if modulate.a <= 0.0:
		return  # Ignore input if the ColorRect is fully transparent
