extends CanvasLayer

@onready var audio_player = $AudioStreamPlayer

signal start_game

var score = 0

func show_message(text):
	$Title.text = text
	$Title.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()


	
func update_score():
	score = score + 1
	$Score.text = str(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Score.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_message_timer_timeout():
	$StartButton.hide()
	start_game.emit()


func _on_start_button_pressed():
	
	$TextureRect.hide()
	$StartButton.hide()
	$Score.show()
	$Start_background.hide()
	start_game.emit()
