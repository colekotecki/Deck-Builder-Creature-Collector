class_name DeckManager
extends Node

## Phase 1 Core Card & Resource Economy prototype.
## Pure logic node: knows nothing about drag input or card visuals beyond
## moving Control nodes between containers. UI reacts via signals
## ("signal up"); Main/UI code calls into this node directly ("call down").

signal resources_changed(new_amount: int)
signal card_drawn(card_node: Control)
signal card_played(card_node: Control)

@export var max_hand_size: int = 7
@export var starting_resources: int = 3

var draw_pile: Array[Control] = []
var hand: Array[Control] = []
var discard_pile: Array[Control] = []
var current_resources: int = 0

@onready var hand_container: Control = %Hand
@onready var discard_container: Control = %DiscardZone


func _ready() -> void:
	current_resources = starting_resources
	resources_changed.emit(current_resources)


## Call from Main.gd once, after populating card nodes, to seed the pile.
func initialize_draw_pile(cards: Array[Control]) -> void:
	draw_pile = cards.duplicate()


## Draws one card from the draw pile into the hand, respecting max hand size.
func draw_card() -> void:
	if hand.size() >= max_hand_size:
		return
	if draw_pile.is_empty():
		return

	var card_node: Control = draw_pile.pop_back()
	hand.append(card_node)

	if card_node.get_parent() != hand_container:
		if card_node.get_parent() != null:
			card_node.get_parent().remove_child(card_node)
		hand_container.add_child(card_node)

	card_drawn.emit(card_node)


## Discards a specific card from hand, incrementing resources by 1.
func discard_card(card_node: Control) -> void:
	if not hand.has(card_node):
		return

	hand.erase(card_node)
	discard_pile.append(card_node)

	hand_container.remove_child(card_node)
	discard_container.add_child(card_node)

	_modify_resources(1)


## Attempts to play a card: validates cost, spends resources, moves to discard.
## Returns true if the play succeeded, false otherwise (e.g. insufficient resources).
func play_card(card_node: Control) -> bool:
	if not hand.has(card_node):
		return false

	var cost: int = _get_card_cost(card_node)
	if current_resources < cost:
		return false

	hand.erase(card_node)
	_modify_resources(-cost)

	hand_container.remove_child(card_node)
	discard_container.add_child(card_node)
	discard_pile.append(card_node)

	card_played.emit(card_node)
	return true


## Reads a card's cost. Expects the card node to expose either a get_cost()
## method or a "cost" property; defaults to 0 if neither is present.
## Kept isolated here so Phase 2's real Card.gd only needs to satisfy one contract.
func _get_card_cost(card_node: Control) -> int:
	if card_node.has_method("get_cost"):
		return int(card_node.call("get_cost"))

	var cost_value: Variant = card_node.get("cost")
	if cost_value != null:
		return int(cost_value)

	return 0


func _modify_resources(delta: int) -> void:
	current_resources += delta
	resources_changed.emit(current_resources)
