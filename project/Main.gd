extends Control

enum Table {BASE, LICH, ALCHEMY}
var _lesser_potions := [
	{"name":"Potion of Healing", "effect":"+5 health", "cost":"75", "sell":"50"},
	{"name":"Potion of Strength", "effect":"+1 fight", "cost":"100", "sell":"40"},
	{"name":"Potion of Toughness", "effect":"+1 armor", "cost":"50", "sell":"30"},
	{"name":"Elixer of Speed", "effect":"+2 speed", "cost":"50", "sell":"30"},
	{"name":"Potion of Invisibility", "effect":"Invisibility", "cost":"100", "sell":"50"},
	{"name":"Explosive Cocktail", "effect":"Grenade", "cost":"100", "sell":"30"},
	{"name":"Potion of Teleportation", "effect":"Teleport", "cost":"500", "sell":"100"},
	{"name":"Potion of Elemental Absorption", "effect":"Ignore the next five points of Elemental damage", "cost":"200", "sell":"80"},
	{"name":"Cordial of Clearsight", "effect":"Immune to Beauty and Invisibility, destroys Illusionary Soldiers on contact", "cost":"200", "sell":"80"},
	{"name":"Poison", "effect":"Next hand-to-hand attack that deals damage or next ranged attack inflicts Poison", "cost":"100", "sell":"30"},
	{"name":"Philtre of Fury", "effect":"+1 fight, +1 damage, must move towards the nearest enemy figure within line-of-sight that is nor in combat", "cost":"300", "sell":"120"},
	{"name":"Potion of Iron Mind", "effect":"+5 will", "cost":"50", "sell":"30"},
	{"name":"Bottle of Burrowing", "effect":"Can move through terrain this turn", "cost":"200", "sell":"80"},
	{"name":"Philtre of Fairy Dust", "effect":"One weapon counts as magic for the rest of the game", "cost":"50", "sell":"30"},
	{"name":"Construct Oil", "effect":"After game, +1 move to a Construct (1/per)", "cost":"100", "sell":"50"},
	{"name":"Potion of Fire Breath", "effect":"Spend an action to make a +3 elemental magic shooting attack with range 6", "cost":"200", "sell":"80"},
	{"name":"Potion of Preservation", "effect":"Preserves a dead figure for 5 games, allowing him/her to be ressurected", "cost":"500", "sell":"200"},
	{"name":"Elixer of the Chameleon", "effect":"Invisible from more than 12 inches away", "cost":"400", "sell":"140"},
]
var _greater_potions := [
	{"name":"Cordial of Empowerment", "effect":"+4 to next casting roll made, 2 additional damage, can only be used 1/spellcaster/game", "cost":"500", "sell":"200", "ingredient cost":"200"},
	{"name":"Shrinking Potion", "effect":"Removes all penalties from carrying one treasure", "cost":"500", "sell":"200", "ingredient cost":"200"},
	{"name":"Potion of Restoration", "effect":"Return to full health, removing any negative effect", "cost":"2000", "sell":"300", "ingredient cost":"750"},
	{"name":"Bottle of Dreams and Nightmares", "effect":"Before game, a wizard can drink this potion and make a will roll of 12. On a success, +50 xp. on a fail, the wizard can only get up to 270 xp", "cost":"2000", "sell":"300", "ingredient cost":"500"},
	{"name":"Shatterstar Draught", "effect":"If a figure drinks this potion and then casts a spell they may cast the spell twice, but must declare targets before rolling", "cost":"1500", "sell":"200", "ingredient cost":"600"},
	{"name":"Bottle of Darkness", "effect":"Line of sight reduced to 12 inches", "cost":"1500", "sell":"300", "ingredient cost":"600"},
	{"name":"Ethereal Vacuum", "effect":"All ethereal creatures must make a will roll against 20. If they fail, they are destroyed and xp is granted as normal", "cost":"2000", "sell":"200", "ingredient cost":"800"},
	{"name":"Potion of Invulnerability", "effect":"Immune to non-magic. At the start of the figure's activation, roll a die. On a 17+, the effect ends", "cost":"-", "sell":"400", "ingredient cost":"2000"},
	{"name":"Bottle of Null", "effect":"Cancels all spells in play. Does not unsummon creatures, but does break control", "cost":"-", "sell":"200", "ingredient cost":"1000"},
	{"name":"Elixer of Life", "effect":"Ressurect any dead character without penalty", "cost":"-", "sell":"1000", "ingredient cost":"3000"},
]
var _blank_of_power := "Spend a charge to empower a spell. This item regains all charges between games"
var _magic_items := [
	{"name":"Staff of Power (1)", "effect":"P", "cost":"300", "sell":"150"},
	{"name":"Staff of Power (2)", "effect":"P", "cost":"400", "sell":"200"},
	{"name":"Ring of Transferance", "effect":"May only be worn by a spellcaster. Once per game the wearer may take up to five damage to make a figure in line-of-sight heal that much", "cost":"400", "sell":"150"},
	{"name":"Ring of Power (1)", "effect":"P", "cost":"200", "sell":"100"},
	{"name":"Orb of Power", "effect":"Spend a charge to empower a spell. This item is worthless when expended", "cost":"500", "sell":"200"},
	{"name":"Staff of Casting", "effect":"S", "cost":"500", "sell":"200"},
	{"name":"Boots of Speed", "effect":"+1 move", "cost":"300", "sell":"130"},
	{"name":"Ring of Slow Fall", "effect":"Immune to falling damage", "cost":"200", "sell":"100"},
	{"name":"Ring of Will", "effect":"+1 will", "cost":"300", "sell":"150"},
	{"name":"Ring of Teleportation", "effect":"Teleport 8 inches within line-of-sight and not into or out of combat", "cost":"400", "sell":"150"},
	{"name":"Gloves of Strength", "effect":"+1 damage in hand-to-hand combat", "cost":"300", "sell":"150"},
	{"name":"Robes of Arrow Turning", "effect":"+4 armor against bow and crossbow attacks", "cost":"500", "sell":"250"},
	{"name":"Amulet of Resistance", "effect":"Once per game add 4 to a will roll", "cost":"300", "sell":"100"},
	{"name":"Construct Hammer", "effect":"Equip to a Construct. It is treated as weilding a magic weapon with +1 damage", "cost":"300", "sell":"100"},
	{"name":"Gloves of Casting", "effect":"Once per game before rolling dice, add 5 to a casting roll", "cost":"500", "sell":"200"},
	{"name":"Wand of Light", "effect":"Once per game a figure can roll twice for a casting roll and pick one of the results", "cost":"400", "sell":"200"},
	{"name":"Horn of Destruction", "effect":"Once per game the weilder of this horn can cast Crumble", "cost":"300", "sell":"100"},
	{"name":"Fate Stone", "effect":"Once per game reroll", "cost":"500", "sell":"200"},
	{"name":"Wand of Power (1)", "effect":"P", "cost":"300", "sell":"150"},
	{"name":"Staff of Power (3)", "effect":"P", "cost":"1200", "sell":"300"},
]
var _magic_weapons_and_armor := [
	{"name":"Hand Weapon", "effect":"+1 damage", "cost":"300", "sell":"125"},
	{"name":"Hand Weapon", "effect":"+1 fight", "cost":"500", "sell":"200"},
	{"name":"Hand Weapon", "effect":"+2 will", "cost":"300", "sell":"125"},
	{"name":"Two-Handed Weapon", "effect":"+1 damage", "cost":"300", "sell":"125"},
	{"name":"Two-Handed Weapon", "effect":"+1 fight", "cost":"500", "sell":"200"},
	{"name":"Two-Handed Weapon", "effect":"+2 will", "cost":"300", "sell":"125"},
	{"name":"Bow", "effect":"+1 damage", "cost":"300", "sell":"125"},
	{"name":"Bow", "effect":"+1 shoot", "cost":"600", "sell":"250"},
	{"name":"Crossbow", "effect":"+1 damage", "cost":"300", "sell":"125"},
	{"name":"Crossbow", "effect":"+1 shoot", "cost":"600", "sell":"250"},
	{"name":"Dagger", "effect":"+1 damage", "cost":"300", "sell":"125"},
	{"name":"Dagger", "effect":"+1 fight", "cost":"500", "sell":"200"},
	{"name":"Dagger", "effect":"+2 will", "cost":"300", "sell":"125"},
	{"name":"Light Armor", "effect":"+1 armor", "cost":"600", "sell":"200"},
	{"name":"Heavy Armor", "effect":"Elemental Absorption", "cost":"800", "sell":"300"},
	{"name":"Ring of Protection", "effect":"+1 armor", "cost":"600", "sell":"250"},
	{"name":"Cloak of Protection", "effect":"+1 armor", "cost":"600", "sell":"250"},
	{"name":"Cloak of Night", "effect":"Elemental Absorption", "cost":"500", "sell":"200"},
	{"name":"Staff", "effect":"+1 fight", "cost":"300", "sell":"125"},
	{"name":"Shield", "effect":"+1 armor", "cost":"700", "sell":"250"},
]
var _spells := [
	["Animate Skull", "Bones of the Earth", "Strike Dead", "Control Undead"],
	["Curse", "Poison Dart", "Animal Companion", "Familiar"],
	["Fleet Feet", "Slow", "Crumble", "Fast Act"],
	["Leap", "Imp", "Plane Walk", "Control Demon"],
	["Wall", "Call Storm", "Scatter Shot", "Destructive Sphere"],
	["Push", "Draining Word", "Explosice Rune", "Write Scroll"],
	["Teleport", "Invisibility", "Beauty", "Transpose"],
	["Strength", "Telekenisis", "Enchant Armor", "Control Construct"],
	["Awareness", "True Sight", "Mind Lock", "Mind Control"],
	["Shield", "Banish", "Blinding Light", "Miraculous Cure"],
	["Bone Dart", "Spell Eater", "Steal Health", "Raise Zombie"],
	["Mud", "Fog", "Control Animal", "Brew Potion"],
	["Decay", "Time Store", "Petrify", "Time Walk"],
	["Plague of Insects", "Planar Tear", "Possess", "Summon Demon"],
	["Elemental Bolt", "Elemental Ball", "Elemental Hammer", "Elemental Shield"],
	["Furious Quill", "Absorb Knowledge", "Power Word", "Bridge"],
	["Blink", "Fool's Gold", "Glow", "Illusionary Soldier"],
	["Enchant Weapon", "Grenade", "Embed Enchantment", "Animate Construct"],
	["Combat Awareness", "Wizard Eye", "Suggestion", "Reveal Secret"],
	["Circle of Protection", "Heal", "Dispel", "Destroy Undead"],
]
var _base_game_treasure_table := [
	[{"type":"coins", "qty":50}],
	[{"type":"rand10", "qty":1}],
	[{"type":"rand20", "qty":1}],
	[{"type":"coins", "qty":20}, {"type":"potion", "qty":3}],
	[{"type":"coins", "qty":40}, {"type":"potion", "qty":2}],
	[{"type":"coins", "qty":20}, {"type":"scroll", "qty":2}],
	[{"type":"coins", "qty":40}, {"type":"scroll", "qty":1}],
	[{"type":"weapon", "qty":1}],
	[{"type":"coins", "qty":20}, {"type":"weapon", "qty":1}],
	[{"type":"coins", "qty":40}, {"type":"weapon", "qty":1}],
	[{"type":"item", "qty":1}],
	[{"type":"coins", "qty":20}, {"type":"item", "qty":1}],
	[{"type":"coins", "qty":40}, {"type":"item", "qty":1}],
	[{"type":"grimoire", "qty":1}],
	[{"type":"coins", "qty":20}, {"type":"grimoire", "qty":1}],
	[{"type":"coins", "qty":40}, {"type":"grimoire", "qty":1}],
	[{"type":"coins", "qty":60}, {"type":"grimoire", "qty":1}],
	[{"type":"coins", "qty":80}, {"type":"grimoire", "qty":1}],
	[{"type":"coins", "qty":100}, {"type":"grimoire", "qty":1}],
	[{"type":"coins", "qty":120}, {"type":"grimoire", "qty":1}],
]
var _table = Table.BASE


func _on_Button_pressed():
	var you_found := ""
	if _table == Table.BASE:
		var treasure_table := _base_game_treasure_table
		var treasure_index := d(20)
		var treasure = treasure_table[treasure_index]
		for item in treasure:
			var value := ""
			if item["type"] == "coins":
				value = str(item["qty"])
				you_found += (value+"gc")+(", " if treasure.size() > 1 else ".")
			elif item["type"] == "rand10":
				value = str((d(20)+1)*10)
				you_found += (value+"gc")+(", " if treasure.size() > 1 else ".")
			elif item["type"] == "rand20":
				value = str((d(20)+1)*20)
				you_found += (value+"gc")+(", " if treasure.size() > 1 else ".")
			if item["type"] != "coins":
				for x in item["qty"]:
					if item["type"] == "potion":
						var potion:Dictionary
						var potion_type = d(20)
						if potion_type > 18:
							var potion_index := d(10)
							potion = _greater_potions[potion_index]
							you_found += splice(potion)
						else:
							potion = _lesser_potions[d(18)]
							you_found += splice(potion)
					elif item["type"] == "item":
						var magic_item:Dictionary = _magic_items[d(20)]
						you_found += splice(magic_item)
					elif item["type"] == "weapon":
						var weapon:Dictionary = _magic_weapons_and_armor[d(20)]
						you_found += splice(weapon)
					elif item["type"] == "scroll":
						var spell := _generate_spell()
						you_found += "Scroll of "+spell+" "
					elif item["type"] == "grimoire":
						var spell := _generate_spell()
						you_found += "Grimoire of "+spell+" "
	$Label.text = you_found

func splice(item:Dictionary)->String:
	var spliced := ""
	spliced += item["name"]+": "
	if item["effect"] == "P":
		spliced += _blank_of_power+", "
	elif item["effect"] == "S":
		var spell := _generate_spell()
		spliced += "+1 to cast "+spell+", "
	else:
		spliced += item["effect"]+". "
	for tag in item:
		if tag == "cost":
			spliced += "cost: "+item[tag]+"gc, "
		elif tag == "sell":
			spliced += "sell: "+item[tag]+"gc. "
	return spliced

func _generate_spell()->String:
	var spell_index := Vector2(d(20), d(4))
	var spell:String = _spells[spell_index.x][spell_index.y]
	return spell

func d(sides:int)->int:
	return randi()%sides
