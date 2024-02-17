class_name character_sheet extends CharacterBody3D

@export_group("Stats")
@export var max_health := 64.0
@export var current_health := 64.0
@export var max_mana := 8.0
@export var current_mana := 8.0
@export var stamina := 64.0
@export var current_stamina := 64.0
@export var speed := 2.0
@export var jump_speed := 4.0

@export_group("Attributes")
@export var strength := 8
@export var dexterity := 8
@export var constitution := 8
@export var intelligence := 8
@export var wisdom := 8
@export var charisma := 8

@export_group("Skills")
@export_subgroup("Combat")
@export var heavy_armor := 0
@export var light_armor := 0
@export var martial_weapons := 0
@export var simple_weapons := 0
@export_subgroup("Magic")
@export var arcane_craft := 0
@export var charm := 0
@export var transmutation := 0
@export var evocation := 0
@export var summoning := 0
@export_subgroup("Personal")
@export var deceit := 0
@export var gallantry := 0
@export var medicine := 0
@export var performance := 0
@export_subgroup("Stealth")
@export var trickery := 0
@export var hiding := 0
@export var locks := 0
