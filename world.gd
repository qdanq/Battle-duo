extends Node

@onready var main_menu = $CanvasLayer/MainMenu
@onready var address_entry = $CanvasLayer/MainMenu/MarginContainer/VBoxContainer/AddressEntry
@onready var hud = $CanvasLayer/HUD
@onready var health_bar = $CanvasLayer/HUD/HealthBar


const Player = preload("res://player.tscn")

const PORT = 6006
var enet_peer = ENetMultiplayerPeer.new() # For future loby declare clear var and enet move to hostbutton


func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_host_button_pressed():
	main_menu.hide()
	hud.show()
	
	enet_peer.create_server(PORT)
	multiplayer.multiplayer_peer = enet_peer
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
	
	add_player(multiplayer.get_unique_id())

	#enet_peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	
	#multiplayer.set_multiplayer_peer(enet_peer)

func _on_join_button_pressed():
	main_menu.hide()
	hud.show()
	
	enet_peer.create_client(address_entry.text, PORT)
	multiplayer.multiplayer_peer = enet_peer
	#enet_peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	#multiplayer.set_multiplayer_peer(enet_peer)
	
func add_player(peer_id):
	var player = Player.instantiate()
	player.name = str(peer_id)
	add_child(player)
	player.global_position += Vector3(-4.598, 148.188, -19.367)
	
	if player.is_multiplayer_authority():
		player.health_changed.connect(update_health_bar)
		

func remove_player(peer_id):
	var player = get_node_or_null(str(peer_id))
	if player:
		player.queue_free()

func update_health_bar(health_value):
	health_bar.value = health_value

func _on_multiplayer_spawner_spawned(node):
	if node.is_multiplayer_authority():
		node.health_changed.connect(update_health_bar)
		
@rpc("any_peer")
func SendPlayerInformation(name, id):
	if !GameManager.players.has(id):
		GameManager.players[id] = {
			"name": name,
			"id": id,
		}
#
#	if multiplayer.is_server():
#		for i in GameManager.players:
#			SendPlayerInformation.rpc(GameManager.players[i].name, i)
#
