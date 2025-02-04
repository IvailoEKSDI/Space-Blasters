extends CanvasLayer
signal start_game

func _ready():
	$ScoreLabel.text = str(0)
	$ScoreLabel.hide()
	$PlayAgain.hide()
	$HighScore.hide()
	$Bullets.hide()
	$BackToMenu.hide()
	$BackToMenu2.hide()
	$"Music Label".hide()
	$"Music Volume".hide()
	$"SoundFX Label".hide()
	$"SoundFX Volume".hide()
	$CreditsInfo.hide()

func update_score(score):
	$ScoreLabel.text = str(score)

func update_bullets(score):
	$Bullets.text = "You can pew pew " + str(score) + " more times!"

func update_high_score(score):
	$ScoreLabel.hide()
	$HighScore.show()
	$HighScore.text = "New high score!\nYou got " + str(score) + " points."

func _on_Quit_pressed():
	get_tree().quit()

func _on_Start_pressed():
	emit_signal("start_game")
	$Credits.hide()
	$Options.hide()
	$Quit.hide()
	$WelcomeLabel.hide()
	$Start.hide()

func game_over():
	$ScoreLabel.hide()
	$Bullets.hide()
	$PlayAgain.show()
	$BackToMenu.show()

func _on_PlayAgain_pressed():
	$ScoreLabel.text = str(0)
	emit_signal("start_game")
	$PlayAgain.hide()
	$HighScore.hide()
	$BackToMenu.hide()

func _on_BackToMenu_pressed():
	$BackToMenu.hide()
	$HighScore.hide()
	$PlayAgain.hide()
	$Credits.show()
	$Options.show()
	$Quit.show()
	$WelcomeLabel.show()
	$Start.show()

func _on_Options_pressed():
	$Credits.hide()
	$Options.hide()
	$Quit.hide()
	$Start.hide()
	$BackToMenu2.show()
	$"Music Label".show()
	$"Music Volume".show()
	$"SoundFX Label".show()
	$"SoundFX Volume".show()

func _on_SoundFX_Volume_value_changed(value):
	AudioServer.set_bus_volume_db(2, value - 60)

func _on_Music_Volume_value_changed(value):
	AudioServer.set_bus_volume_db(1, value - 60)

func _on_BackToMenu2_pressed():
	$BackToMenu2.hide()
	$HighScore.hide()
	$PlayAgain.hide()
	$"Music Label".hide()
	$"Music Volume".hide()
	$"SoundFX Label".hide()
	$"SoundFX Volume".hide()
	$CreditsInfo.hide()
	$Credits.show()
	$Options.show()
	$Quit.show()
	$WelcomeLabel.show()
	$Start.show()


func _on_Credits_pressed():
	$Credits.hide()
	$Options.hide()
	$Quit.hide()
	$WelcomeLabel.hide()
	$Start.hide()
	$CreditsInfo.show()
	$BackToMenu2.show()
