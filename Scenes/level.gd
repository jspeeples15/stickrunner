extends Node2D

var star_scene: PackedScene = load("res://Scenes/Star.tscn")
var possibleIdxs: Array[Array]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for spawn_area in $SpawnAreas.get_children():
		possibleIdxs.append_array(spawn_area.star_spaces)
	add_star()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func add_star() -> void:
	var star = star_scene.instantiate()
	star.determine_position(possibleIdxs)
	star.connect('collected', _on_star_collected)
	$Stars.add_child(star)
	
func _on_star_collected() -> void:
	add_star()
