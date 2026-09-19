class_name CardInstance
extends RefCounted

var data: CardData
var uid: int                               # unique per copy, survives save/load
var source_creature_id: StringName = &""   # set on signature cards so the bank can pull them
