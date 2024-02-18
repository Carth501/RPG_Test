class_name conversation extends Panel

signal end_conversation
@export var conversation_log : RichTextLabel
@export var topic_list : RichTextLabel
@export var names : RichTextLabel

func set_participants(attendees: Array[npc]):
	var list = "[center]"
	for person in attendees:
		list += " " + person.name + " "
		person.set_conversation(self)
		person.greet()
	list += "[/center]"
	names.set_text(list)

func _on_link_clicked(meta):
	pass # Replace with function body.

func add(dialogue : String):
	conversation_log.text += dialogue

func close():
	conversation_log.set_text("")
	end_conversation.emit()
