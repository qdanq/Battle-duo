extends Node

@onready var main_menu = $CanvasLayer/MainMenu
@onready var address_entry = $CanvasLayer/MainMenu/MarginContainer/VBoxContainer/AddressEntry
@onready var hud = $CanvasLayer/HUD
@onready var health_bar = $CanvasLayer/HUD/HealthBar


const Player = preload("res://player.tscn")

const PORT = 6006
var enet_peer = ENetMultiplayerPeer.new() # For future loby declare clear var and enet move to hostbutton


func _ready():
	multiplayer.peer_connected.connect(peer_connected)
	multiplayer.peer_disconnected.connect(peer_disconnected)
	multiplayer.peer_connected_to_server.connect(Connected_to_server)
	multiplayer.connection_failed.connect(Connection_failed)
	

func peer_connected(id):
	print("Player connected " + id)
	
func peer_disconnected(id):
	print("Player disconnected" + id)

func _on_host_button_button_down():
	pass # Replace with function body.


func _on_join_button_button_down():
	pass # Replace with function body.


func _on_start_game_button_down():
	pass # Replace with function body.



















#func _unhandled_input(event):
#	if Input.is_action_just_pressed("quit"):
#		get_tree().quit()
#
#func _on_host_button_pressed():
#	main_menu.hide()
#	hud.show()
#
#	enet_peer.create_server(PORT)
#	multiplayer.multiplayer_peer = enet_peer
#	multiplayer.peer_connected.connect(add_player)
#	multiplayer.peer_disconnected.connect(remove_player)
#
#	add_player(multiplayer.get_unique_id())
#
#	#enet_peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
#
#	#multiplayer.set_multiplayer_peer(enet_peer)
#
#func _on_join_button_pressed():
#	main_menu.hide()
#	hud.show()
#
#	enet_peer.create_client(address_entry.text, PORT)
#	multiplayer.multiplayer_peer = enet_peer
#	#enet_peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
#	#multiplayer.set_multiplayer_peer(enet_peer)
#
#func add_player(peer_id):
#	var player = Player.instantiate()
#	player.position = Vector3(-255.6, 148.15, -25.796)
#	player.name = str(peer_id)
#	add_child(player)
#
#	if player.is_multiplayer_authority():
#		player.health_changed.connect(update_health_bar)
#
#
#func remove_player(peer_id):
#	var player = get_node_or_null(str(peer_id))
#	if player:
#		player.queue_free()
#
#func update_health_bar(health_value):
#	health_bar.value = health_value
#
#func _on_multiplayer_spawner_spawned(node):
#	if node.is_multiplayer_authority():
#		node.health_changed.connect(update_health_bar)



