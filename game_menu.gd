extends Control

@onready var playerNameLabel = $CanvasLayer/PlayerInfo/PlayerNameLabel
@onready var playerClassLabel = $CanvasLayer/PlayerInfo/PlayerClassLabel
@onready var playerGoldLabel = $CanvasLayer/PlayerInfo/PlayerGoldLabel
@onready var playerLevelLabel =$CanvasLayer/PlayerInfo/PlayerLevelLabel
@onready var playerExperienceLabel = $CanvasLayer/PlayerInfo/PlayerExperienceLabel
@onready var playerHealthLabel = $CanvasLayer/PlayerInfo/PlayerHealthLabel
@onready var playerACLabel = $CanvasLayer/PlayerInfo/PlayerACLabel

func _ready():
	var playerName = Globals.player_name
	var playerClass = Globals.player_class
	var playerLevel = Globals.player_level
	var playerGold = Globals.player_gold
	var playerXP = Globals.player_xp
	var playerAC = Globals.player_armor_class
	var playerHealth = Globals.player_health

	if playerNameLabel:
		playerNameLabel.text = "Player: " + playerName

	if playerClassLabel:
		playerClassLabel.text = "Class: " + playerClass
	
	if playerGoldLabel:
		playerGoldLabel.text = "Gold: " + str(playerGold)
	
	if playerExperienceLabel:
		playerExperienceLabel.text = "Exp: " +str(playerXP)
	
	if playerLevelLabel:
		playerLevelLabel.text="Level: " + str(playerLevel)
	
	if playerACLabel:
		playerACLabel.text ="AC: " + str(playerAC)
		
	if playerHealthLabel:
		playerHealthLabel.text = "Health: " + str(playerHealth)
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu.tscn")
	
func _save_game():
	var save_data = {
		"player_name": Globals.player_name,
		"player_class": Globals.player_class,
		"gold": Globals.player_gold,
		"level": Globals.player_level,
		"experience": Globals.player_xp
		}
		
	var file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Game saved sucessfully!")
	else:
		print("Error Saving game")
			
func _load_game():
	var file = FileAccess.open("user://savegame.json", FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var data = JSON.parse_string(json_string)
		if data.result: #Check for parsing errors
			Globals.player_name = data.result.player_name
			Globals.player_class = data.result.player_class
			Globals.player_gold = data.result.gold
			Globals.player_xp = data.result.experience
			Globals.player_level = data.result.level
			Globals.player_armor_class =data.result.armor_class
			Globals.player_health = data.result.player_health
			
			#Update UI
			_update_ui()
			
			print("Game Loaded sucessfully")
		else:
			print("Error parsing save data: " + data.error)
	else:
		print("No save file found")
		
func _update_ui():
	if playerNameLabel:
		playerNameLabel.text = "Player: " + Globals.player_name 
	if playerClassLabel:
		playerClassLabel.text = "Class: " + Globals.player_class 
	if playerGoldLabel:
		playerGoldLabel.text = "Gold: " + str(Globals.player_gold) 
	if playerExperienceLabel:
		playerExperienceLabel.text = "Exp: " + str(Globals.player_xp)
	if playerLevelLabel:
		playerLevelLabel.text = "Level: " + str(Globals.player_level) 
	if playerHealthLabel:
		playerHealthLabel.text = "Health: " + str(Globals.player_health)
	if playerACLabel:
		playerACLabel.text = "AC: " + str(Globals.player_armor_class)


func _on_next_encounter_button_pressed() -> void:
	get_tree().change_scene_to_file("res://encounter.tscn")
