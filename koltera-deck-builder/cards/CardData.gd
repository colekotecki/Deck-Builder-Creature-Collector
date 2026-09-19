class_name CardData
extends Resource

enum Category { ATTACK, SKILL, POWER, SIGNATURE }

@export var id: StringName = &""          # stable ID: saves, Sandbox dropdown, Catalog
@export var card_name: String = ""
@export var element: Element.Type = Element.Type.EARTH
@export var category: Category = Category.ATTACK
@export var cost_typed: int = 0           # paid in this card's element
@export var cost_generic: int = 0         # paid via manual allocation
@export var resource_gain: int = 1        # mana on discard (bottom right)
@export_multiline var description: String = ""
@export var icon: Texture2D
@export var effect_id: StringName = &""
