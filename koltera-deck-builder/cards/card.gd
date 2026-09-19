class_name Card
extends Control

## Visual representation of a single card. Satisfies the get_cost() contract
## that DeckManager._get_card_cost() checks for. Purely reads from CardData —
## never mutates it. Drag/drop behavior is intentionally NOT here; it will
## live in a separate DraggableComponent child (composition, not inheritance)
## added in the next step, which Card will relay signals from.

@export var data: CardData:
	set(value):
		data = value
		_update_display()

@onready var icon_rect: TextureRect = %IconRect
@onready var name_label: Label = %NameLabel
@onready var cost_label: Label = %CostLabel
@onready var description_label: Label = %DescriptionLabel


func _ready() -> void:
	_update_display()


## Called by DeckManager._get_card_cost() via has_method("get_cost") check.
func get_cost() -> int:
	if data == null:
		return 0
	return data.cost


func _update_display() -> void:
	# Guarded because the `data` setter can fire before @onready nodes exist
	# (e.g. when `data` is assigned immediately after instantiating the scene).
	if name_label == null:
		return

	if data == null:
		name_label.text = ""
		cost_label.text = ""
		description_label.text = ""
		icon_rect.texture = null
		return

	name_label.text = data.card_name
	cost_label.text = str(data.cost)
	description_label.text = data.description
	icon_rect.texture = data.icon
