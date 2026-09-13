class_name Inventory
extends Node

var slots: Array[InventorySlot]
@onready var window: Panel = get_node("window")
@onready var info_text: Label = get_node("window/infotxt")
@export var starter_items: Array[ItemList]

func _ready ():
	#ASSURE INVENTORY IS NOT VISIBLE AT START OF GAME!!
	toggle_window(false)
	
	
		
func _process (delta):
	#ASSIGN SLOTS FOR ITEMS!! SET TO NULL SO SLOTS ARE BLANK WITH NO DEFAULT ITEMS!!
	for child in get_node("window/slotContainer").get_children():
		slots.append(child)
		child.set_item(null)
		child.inventory = self

	for item in starter_items:
		add_item(item)
	
	if Input.is_action_just_pressed("inventory"):
		toggle_window(!window.visible)

func toggle_window (open : bool):
	window.visible = open
	
	#DISPLAY MOUSE CURSOR WHEN INVENTORY IS OPEN!!
	if open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func on_give_player_item (item : ItemList, amount : int):
	pass

func add_item (item : ItemList):
	var slot = get_slot_to_add(item)
	
	if slot == null:
		return
		
	if slot.item == null:
		slot.set_item(item)
	elif slot.item == item:
		slot.add_item()

func remove_item (item : ItemList):
	var slot = get_slot_to_remove(item)
	
	if slot == null or slot.item == item:
		return
		
	slot.remove_item()

func get_slot_to_add (item : ItemList) -> InventorySlot:
	for slot in slots:
		if slot.item == item and slot.quantity < item.max_stack_size:
			return slot
	
	for slot in slots:
		if slot.item == null:
			return slot
			
	return null

func get_slot_to_remove (item : ItemList) -> InventorySlot:
	for slot in slots:
		if slot.item == item:
			return slot
			
	return null

func get_number_of_item (item : ItemList) -> int:
	var total = 0
	
	for slot in slots:
		if slot.item == item:
			total += slot.quantity
	
	return total
