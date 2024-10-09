extends Area2D

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var is_safe = true
signal collected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	is_safe = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
		
	if is_safe:
		print("safely entered")
	else:
		print("GAME OVER!")


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		is_safe = false
		collected.emit()
		$Sprite.texture.region = Rect2(840,420,70,70)

func determine_position(possibleIdxs: Array[Array]) -> void: 
	var chosenIdx = possibleIdxs[rng.randi_range(0,possibleIdxs.size())]
	
	position = Vector2((chosenIdx[0] * 70) + 35,(chosenIdx[1] * 70) + 35)
