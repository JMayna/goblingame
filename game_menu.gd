extends Control

@onready var playerNameLabel = $CanvasLayer/PlayerInfo/PlayerNameLabel
@onready var playerClassLabel = $CanvasLayer/PlayerInfo/PlayerClassLabel
@onready var playerGoldLabel = $CanvasLayer/PlayerInfo/PlayerGoldLabel
@onready var playerLevelLabel =$CanvasLayer/PlayerInfo/PlayerLevelLabel
@onready var playerExperienceLabel = $CanvasLayer/PlayerInfo/PlayerExperienceLabel

func _ready():
	var playerName = Globals.player_name
	var playerClass = Globals.player_class
	var playerLevel = Globals.player_level
	var playerGold = Globals.player_gold
	var playerExperience = Globals.player_experince

	if playerNameLabel:
		playerNameLabel.text = "Player: " + playerName

	if playerClassLabel:
		playerClassLabel.text = "Class: " + playerClass
	
	if playerGoldLabel:
		playerGoldLabel.text = "Gold: " + str(playerGold)
	
	if playerExperienceLabel:
		playerExperienceLabel.text = "Exp: " +str(playerExperience)
	
	if playerLevelLabel:
		playerLevelLabel.text="Level: " + str(playerLevel)
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu.tscn")
