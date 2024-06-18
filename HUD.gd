extends CanvasLayer

# Notifies the `Main` node the the button has been pressed
signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MesageTimer has counted down
	await $MessageTimer.timeout
	
	$Message.text = "DODGE THE CREEPS!"
	$Message.show()
	# Make a one-shot timer and wait for it to finish
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()


func _on_message_timer_timeout():
	$Message.hide()
