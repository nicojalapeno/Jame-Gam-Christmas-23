extends Area2D

var selected = false
var mousepos = null
var bearAreas = false
var mouse_enter = false
var frame_progress = -1
var present_ready = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if selected == true :
		mousepos = get_viewport().get_mouse_position()
		position = mousepos
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == false and event.pressed and frame_progress == -1 and mouse_enter == true:
		frame_progress = frame_progress + 1
		position = Vector2(360,320)
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == false and event.pressed and frame_progress < 2 and  frame_progress > -1 and mouse_enter == true :
		frame_progress = frame_progress + 1
		$AnimatedSprite2D.set_frame_and_progress(frame_progress,0)
#		selected = true
		#position = current_overlap_pos
	#This elif is for selecting the completed bear
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == false and event.pressed and frame_progress == 2 and mouse_enter == true and bearAreas == false:
		selected = true
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and selected == true and event.pressed and frame_progress == 2 and bearAreas == true:
		selected = false
		position = Vector2(576,320)
		present_ready = true
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT  and event.pressed and present_ready == true and frame_progress  < 4 and frame_progress >= 2 :
		frame_progress = frame_progress + 1
		$AnimatedSprite2D.set_frame_and_progress(frame_progress,0)
	#the reset if statement
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT  and event.pressed and present_ready == true  and frame_progress == 4 :
		var scoreNode = get_node("../HUD")
		scoreNode.update_score()
		position = Vector2(120,304)
		frame_progress = -1
		$AnimatedSprite2D.set_frame_and_progress(0,0)
		selected = false
		present_ready = false
		bearAreas = false
		
		
		

func _on_bear_areas_overlap():
	if selected == true:
		bearAreas = true

func _on_bear_areas_left():
	if selected == true:
		bearAreas = false



func _on_mouse_shape_entered(shape_idx):
	mouse_enter = true


func _on_mouse_exited():
	mouse_enter = false
	



