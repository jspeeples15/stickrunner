extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var current_state: PlayerState.State
signal state_change
func _ready():
	set_state(PlayerState.State.IDLE)

func _physics_process(delta: float) -> void:
	var newest_state: PlayerState.State = current_state
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			newest_state = PlayerState.State.RIGHT
		else:
			newest_state = PlayerState.State.LEFT
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if not is_on_floor():
		newest_state = handle_airborn(delta)
		
	if velocity.x == 0 and velocity.y == 0:
		newest_state = PlayerState.State.IDLE

	set_state(newest_state)
	move_and_slide()

func set_state(new_state: PlayerState.State) -> void: 
	if current_state != new_state:
		current_state = new_state
		state_change.emit(new_state)
		
func handle_airborn(delta: float) -> PlayerState.State:
	velocity += get_gravity() * delta
	if velocity.x < 0 and velocity.y > 0:
		return PlayerState.State.UPLEFT
	elif velocity.x == 0 and velocity.y > 0:
		return PlayerState.State.UP
	elif velocity.x > 0 and velocity.y > 0:
		return PlayerState.State.UPRIGHT
	elif velocity.x < 0 and velocity.y < 0:
		return PlayerState.State.DOWNLEFT
	elif velocity.x == 0 and velocity.y < 0:
		return PlayerState.State.DOWN
	elif velocity.x < 0 and velocity.y < 0:
		return PlayerState.State.DOWNRIGHT
	else:
		return PlayerState.State.DOWN
