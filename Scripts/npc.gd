class_name npc extends character_sheet

@export var dialog_file : Resource
var dialog : Dictionary
var convo : conversation

func _ready():
	var file = FileAccess.open(dialog_file.resource_path, FileAccess.READ)
	var content_as_text = file.get_as_text()
	var json = JSON.new()
	var error = json.parse(content_as_text)
	if error != OK:
		push_error("JSON Parse Error: ", json.get_error_message(), 
		" in ", content_as_text, " at line ", json.get_error_line())
		return
	var data_received = json.data
	if typeof(data_received) == TYPE_DICTIONARY:
		print(data_received)
		dialog = data_received
	else:
		print("Unexpected data")

func set_conversation(new_convo : conversation):
	convo = new_convo
	convo.topic.connect(lookup)
	convo.end_conversation.connect(end_convo)

func end_convo():
	convo.topic.disconnect(lookup)
	convo.end_conversation.disconnect(end_convo)

func greet():
	lookup("greeting")

func lookup(id : String):
	if(dialog.has(id)):
		convo.add(name, dialog[id])
	else:
		convo.simple_add(name, "I have nothing to say about that.")
