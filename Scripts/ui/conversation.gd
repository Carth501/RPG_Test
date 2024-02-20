class_name conversation extends Panel

signal topic_brought_up(String)
signal end_conversation
signal topic(id : String)
@export var conversation_log : RichTextLabel
@export var topic_list : RichTextLabel
@export var names : RichTextLabel

func set_participants(attendees: Array[npc]):
	var list = "[center]"
	var i = 1
	for person in attendees:
		if(i < attendees.size()):
			list += ","
		list += " " + person.name + " "
		person.set_conversation(self)
		person.greet()
		i += 1
	list += "[/center]"
	names.set_text(list)

func _on_link_clicked(topic_id):
	topic.emit(topic_id)

func add(speaker_name : String, dialog : Variant):
	conversation_log.text += speaker_name + ": " + dialog.text + "\n"
	if(dialog.has("topics")):
		for topic in dialog.topics:
			topic_brought_up.emit(topic)

func simple_add(speaker_name : String, dialog : String):
	conversation_log.text += speaker_name + ": " + dialog + "\n"

func close():
	conversation_log.set_text("")
	end_conversation.emit()

func set_topic_list(topics : Array[String]):
	var list := ""
	for topic in topics:
		list += (str("\n[url=" + topic + "]"  + topic.to_lower().capitalize() + "[/url]"))
	topic_list.set_text(list)
