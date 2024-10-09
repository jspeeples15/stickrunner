extends StaticBody2D

var star_spaces: Array[Array]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var starting_x_idx = floor(global_position.x / 70)
	var starting_y_idx = floor(global_position.y / 70)
	print( "global area: [%f,%f]" % [starting_x_idx, starting_y_idx] )
	for currX in scale.x:
		for currY in scale.y:
			star_spaces.append([currX+starting_x_idx, currY+starting_y_idx])
			print( "[%f,%f]" % [currX+starting_x_idx, currY+starting_y_idx] )
	print(star_spaces)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
