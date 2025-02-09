extends Control

@onready var playerHealthLabel =$CanvasLayer/playerInfo/playerHealthLabel
@onready var playerNameLabel = $CanvasLayer/playerInfo/playerNameLabel
@onready var enemyHealthLabel = $CanvasLayer/enemyInfo/enemyHealthLabel
@onready var attackButton = $CanvasLayer/attackButton
@onready var battleLog = $CanvasLayer/battleLog

#Enemy Stats (Not da globals)
var enemy = {
	"health": 50,
	"attack": 8,
	"armor_class": 12
}



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Get Player stats from da Globals
	playerHealthLabel.text = "Health: " + str(Globals.player_health)
	playerNameLabel.text = Globals.player_name
	attackButton.connect("pressed", _on_attack_button_pressed)
	


func _on_attack_button_pressed() -> void:
	#1. Players turn
	var attack_roll = randi_range(1, 20) #Dice roll
	var message = "Player Attack Roll: " + str(attack_roll) + "\n"  #This stores da message
	var damage_roll = 0
	
	if attack_roll >= enemy.armor_class:
		damage_roll = randi_range(1,10)
		enemy.health -= damage_roll
		message += "Player hit for " + str(damage_roll) + " damage!\n"
		enemyHealthLabel.text = "Enemy Health: " + str(enemy.health)
	else:
		message = "Player Attack Roll: " + str(attack_roll) + "\n" +  "Player missed!\n" #Store Message
		
		message += "\n"
		
	#2 . Enemy's Turn
	var enemy_attack_roll = randi_range(1, 20)
	message += "Enemy Attack Roll: " + str(enemy_attack_roll) + "\n" #Store message
	var enemy_damage_roll = 0
	
	
	if enemy_attack_roll >= Globals.player_armor_class: #From da globals
		enemy_damage_roll = randi_range (1, enemy.attack)
		Globals.player_health -= enemy_damage_roll #Hopefully will update da Globals
		message += "Enemy Hits for: " + str(enemy_damage_roll) + " damage\n" #Store message
		playerHealthLabel.text = "Player Health: " + str(Globals.player_health) #Globals
	else:
		message += "Enemy Missed\n"
		
	message += "\n"
	
	#3 Update da battle log
	battleLog.append_text(message) #Add the combined message
	
	
	
	
	#4 Chceck for Game Over (add later)
	if Globals.player_health <= 0: # check globals
		print("Player is defeated")
	if enemy.health <= 0:
		print('Enemy is defeated')
