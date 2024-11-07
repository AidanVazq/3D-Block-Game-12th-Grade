extends Node3D

# Enemy properties
var health: int = 100
var attack_damage: int = 10
var attack_range: float = 10.0
var attack_delay: float = 2.0


# Timer for attack delay
var attack_timer: Timer

# Reference to the player (set this in the inspector or find it in _ready)
var player: Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# Initialize timer
	#attack_timer = Timer.new()
	#attack_timer.wait_time = attack_delay
	#attack_timer.connect("timeout", self, "_on_attack_timeout")
	#add_child(attack_timer)
	
	# Start the attack timer
	#attack_timer.start()

# Function to handle attacking the player
func _on_attack_timeout():
	if player and is_instance_valid(player):
		var distance_to_player = global_position.distance_to(player.global_position)
		if distance_to_player <= attack_range:
			attack_player()

# Simulate attacking the player
func attack_player():
	# Play attack animation here
	print("Attacking the player! Damage: ", attack_damage)

# Function to take damage
func take_damage(amount: int):
	health -= amount
	print("Enemy took damage! Current health: ", health)
	
	if health <= 0:
		queue_free()  # Remove enemy from the scene

# Optional: Function to set the player reference
func set_player(target_player: Node3D):
	player = target_player
