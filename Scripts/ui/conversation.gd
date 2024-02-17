class_name conversation extends Panel

@onready var conversation_log := $"ConversationLog/LogBody"
@onready var topic_list := $"Topics/TopicList"
@onready var names := $"Names"

func set_participants(attendees: Array[String]):
	names.text = "[center]"
	for person in attendees:
		names.text += person
	names.text += "[/center]"
