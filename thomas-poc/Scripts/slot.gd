class_name InventorySlot
extends Node

var item: ItemList
var quantity: int

@onready var icon: TextureRect = get_node("icon")
@onready var quantity_text: Label = get_node("qty")
var inventory: Inventory

func set_item (new_item: ItemList):
	item = new_item
	quantity = 1
	
	if item == null:
		icon.visible = false
	else:
		icon.visible = true
		icon.texture = item.icon
	
	update_qty()
	
func add_item ():
	quantity += 1
	update_qty()

func remove_item ():
	quantity -= 1
	update_qty()
	
	if quantity == 0:
		set_item(null)

func update_qty ():
	if quantity <= 1:
		quantity_text.text = ""
	else:
		quantity_text.text = str(quantity)
