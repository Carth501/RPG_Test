class_name npc extends character_sheet

@export_category("npc")
@export var test := ""
var convo : conversation

func set_conversation(new_convo : conversation):
	convo = new_convo

func greet():
	say("Hello!")

func say(stuff : String):
	convo.add(name + ": " + stuff)
