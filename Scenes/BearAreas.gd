extends Area2D
signal overlap
signal left
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	emit_signal("overlap")
	


func _on_mouse_exited():
	emit_signal("left")

