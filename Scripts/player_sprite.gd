extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_player_state_change(new_state: PlayerState.State) -> void:
	match new_state:
		PlayerState.State.IDLE:
			play("idle")
		PlayerState.State.UP:
			play("risenfall")
		PlayerState.State.DOWN:
			play("risenfall")
		PlayerState.State.UPRIGHT:
			flip_h = false
			play("risenfall")
		PlayerState.State.DOWNRIGHT:
			flip_h = false
			play("risenfall")
		PlayerState.State.UPLEFT:
			flip_h = true
			play("risenfall")
		PlayerState.State.DOWNLEFT:
			flip_h = true
			play("risenfall")
		PlayerState.State.RIGHT:
			flip_h = false
			play("run")
		PlayerState.State.LEFT:
			flip_h = true
			play("run")
			
