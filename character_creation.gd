extends Control


@onready var name_input = $Panel/nameInput
@onready var confrim_button = $Panel/confirmButton

@onready var fighter_button = $Panel/ClassSelection/fighterButton
@onready var mage_button = $Panel/ClassSelection/mageButton
@onready var thief_button = $Panel/ClassSelection/thiefButton

func _on_confirm_button_pressed() -> void:
	var player_name = name_input.text
	
	if  player_name.is_empty():
		print("Please enter a player name.")
		return
	
	#Get class from button group
	var player_class = ""
	var class_selected = false
	
	if fighter_button.is_pressed():
		player_class = "Fighter"
	elif mage_button.is_pressed():
		player_class= "Mage"
	elif thief_button.is_pressed():
		player_class= "Thief"	
	
	
	else :
		#Handle no class selected
		print("No class selected")
		return #Don't proceed
	
	print("Player Name: " + player_name)
	print("Player Class: " + player_class)
	
	_save_player_data(player_name,player_class)
	get_tree().change_scene_to_file("res://Game_Menu.tscn")
	
	#Store the data
func _save_player_data(playername, playerclass):
	Globals.player_name = playername
	Globals.player_class = playerclass
	Globals.player_gold = 0
	Globals.player_level = 1
	Globals.player_xp = 0
	
