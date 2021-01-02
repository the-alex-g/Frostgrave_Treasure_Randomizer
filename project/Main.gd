extends Control

enum Table {BASE, LICH, COMP}
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
var _dark_alchemy_treasure_table := [
	[{"type":"coins", "qty":15}],
	[{"type":"coins", "qty":20}],
	[{"type":"coins", "qty":25}],
	[{"type":"coins", "qty":30}],
	[{"type":"coins", "qty":40}],
	[{"type":"coins", "qty":15}, {"type":"potion", "qty":1}],
	[{"type":"coins", "qty":25}, {"type":"potion", "qty":1}],
	[{"type":"coins", "qty":35}, {"type":"potion", "qty":1}],
	[{"type":"coins", "qty":10}, {"type":"scroll", "qty":1}],
	[{"type":"coins", "qty":20}, {"type":"scroll", "qty":1}],
	[{"type":"coins", "qty":30}, {"type":"scroll", "qty":1}],
	[{"type":"coins", "qty":10}, {"type":"potion", "qty":2}],
	[{"type":"coins", "qty":20}, {"type":"potion", "qty":2}],
	[{"type":"coins", "qty":30}, {"type":"potion", "qty":2}],
	[{"type":"potion", "qty":3}],
	[{"type":"weapon", "qty":1}],
	[{"type":"item", "qty":1}],
	[{"type":"grimoire", "qty":1}],
	[{"type":"grimoire", "qty":1}],
	[{"type":"grimoire", "qty":1}],
]
var _lich_lord_treasure := [
	"Book of Bones: Only a wizard may use book to summon a skeleton instead of a zombie when casting Raise Zombie. If cast out-of-game, you can spend 30gc to upgrade it to and armored skeleton. cost: 300gc",
	"Book of the Rangifer: If a warband has this book, they may hire a rangifer for 100gc. The rangifer leaves the warband if any Undead are present before or after a game. cost: 300gc",
	"Boots of Leaping: These boots allow the wearer to make one movement action a turn where they take no penalties from rough terrain or climbing. cost: 250gc",
	"Club of Battering: A two-handed weapon that gives the weilder +1 fight in hand-to-hand combat. When the weilder of this weapon wins a combat, they can push their opponent back up to 3 inches. cost: 300gc",
	"Crystal Rose: A figure that is carrying a Crystal Rose may reroll their survival roll after a game, but they must keep the second result. cost: 400gc",
	"Eyes of Amoto: This is a set of two amulets. One is worn by a spellcaster, one by a soldier. Once per game, the spellcaster may trace line-of-sight from the soldier instead. cost: 300gc",
	"Grimoire of Homunculus",
	"Grimoire of Lichdom",
	"Grimoire of Revenant",
	"Horn of Hellfire: Once per game, the weilder of this horn may make a +5 magic shooting attack at a target within 24 inches and line-of-sight. cost: 400gc",
	"Ivory Scroll",
	"Magic Spectacles: The wearer of these spectacles can see invisible things. If the wearer rolls Lost Eye, the spectacles are destroyed. cost: 250gc",
	"Quiver of the Soul Seeker: This quiver makes any bow or crossbow attacks by its weilder count as magic attacks. cost: 300gc",
	"Ring of Life: +1 fight and +1 armor versus Undead. When fighting Undead, attacks count as magic attacks. cost: 400gc",
	"Scarf of Obscurance: +1 fight against shooting attacks. cost: 350gc",
	"Sword of Undead Slaying: +3 fight against Undead. Otherwise it grants no bonus but counts as a magic weapon. cost: 300gc",
	"Unbreakable Orb: Once per game, the carrier of the Orb may activate it. When activated, the carrier may not do anything, but cannot be in combat or take damage. cost: 300gc",
	"Vampire Blade: When this sword deals damage to a living target, the weilder gets 2 health. The sword is magic but gives no bonus. cost: 300gc",
	"Vial of Starlight (10): Charges may be expended from this item to empower Thamaturge spells, even out-of-game. When empty, this item is worthless. cost: 600gc",
	"Wraithbottle: The carrier of this potion may spend an action to throw the bottle and create a Wraith at any point within line-of-sight and 10 inches. cost: 200gc",
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
var _monsters := {
	"Nullman":{"M":"6", "F":"+1", "S":"+0", "A":"12", "W":"+10", "H":"5", "notes":"Immune to magic, moves toward closest spellcaster within 18 inches instead of random movement"},
	"Fire-Flinger":{"M":"5", "F":"+1", "S":"+3", "A":"12", "W":"+0", "H":"12", "notes":"Construct, if it wins combat it will push back and be done, if is within 6 inches of a warband member it will make a +3 magic elemental shooting attack, it will move into shooting range instead of melee combat"},
	"Burning Skeleton":{"M":"6", "F":"+1", "S":"+0", "A":"10", "W":"+1", "H":"1", "notes":"Undead, if it wins combat the opponent takes 2 damage"},
	"Foulhorn":{"M":"7", "F":"+4", "S":"+0", "A":"12", "W":"+5", "H":"12", "notes":"If this creature moves then attacks in the same activation, it gets +2 fight for that attack"},
	"Starfire Elemental":{"M":"5", "F":"+7", "S":"+0", "A":"6", "W":"+5", "H":"1", "notes":"Levitate, See through terrain, Immune to normal weapons, Destroyed if it inflicts damage, Immune to Invisibility, Mind Control, Possess, and Beauty"},
	"Banshee":{"M":"9", "F":"+0", "S":"+0", "A":"10", "W":"+5", "H":"10", "notes":"Undead, Immaterial, Immune to non-magic, On its turn Banshee will make a random move, and then all non-undead or constructs within 6 inches must make a will roll of 10 or take damage by the amount they failed"},
	"Death Cultist":{"M":"6", "F":"+0", "S":"+0", "A":"10", "W":"+5", "H":"10", "notes":""},
	"Frost Wraith":{"M":"6", "F":"+2", "S":"+0", "A":"10", "W":"+3", "H":"6", "notes":"Undead, +2 fight against Living creatures"},
	"Ghoul King":{"M":"8", "F":"+4", "S":"+0", "A":"12", "W":"+6", "H":"14", "notes":"Undead, Immune to Control, +2 damage"},
	"Rangifer":{"M":"7", "F":"+2", "S":"+0", "A":"12", "W":"+3", "H":"12", "notes":"+1 fight and attacks count as Magical against Undead"},
	"Spectre":{"M":"9", "F":"+0", "S":"+0", "A":"10", "W":"+10", "H":"8", "notes":"Undead, Immaterial, Immune to non-magic"},
	"Wraith Knight":{"M":"6", "F":"+3", "S":"+0", "A":"10", "W":"+5", "H":"10", "notes":"Undead, Immaterial, Immune to Control, Immune to non-magic, x2 damage"},
	"Zombie Troll":{"M":"4", "F":"+4", "S":"+0", "A":"14", "W":"+2", "H":"10", "notes":"Undead, Large, +2 damage"},
	"Bear":{"M":"6", "F":"+4", "S":"+0", "A":"12", "W":"+0", "H":"14", "notes":"Animal, Large, +2 damage"},
	"Boar":{"M":"6", "F":"+2", "S":"+0", "A":"12", "W":"+2", "H":"8", "notes":"Animal, Bounty(10gc), If this creature moves then attacks in the same activation, it gets +2 fight for that attack"},
	"Giant Rat":{"M":"6", "F":"+0", "S":"+0", "A":"6", "W":"+0", "H":"1", "notes":"Animal, Pack Hunter"},
	"Ice Spider":{"M":"6", "F":"+1", "S":"+0", "A":"8", "W":"+0", "H":"4", "notes":"Animal, Expert Climber"},
	"Ice Toad":{"M":"4", "F":"+2", "S":"+0", "A":"10", "W":"+0", "H":"5", "notes":"Takes no penalties from being in water, Animal, x2 damage"},
	"Snow Leopard":{"M":"8", "F":"+3", "S":"+0", "A":"10", "W":"+2", "H":"10", "notes":"Animal, Expert Climber"},
	"White Gorilla":{"M":"6", "F":"+4", "S":"+0", "A":"12", "W":"+8", "H":"14", "notes":"Animal, +2 damage"},
	"Wild Dog":{"M":"8", "F":"+0", "S":"+0", "A":"8", "W":"+0", "H":"4", "notes":"Animal, Pack Hunter"},
	"Wolf":{"M":"8", "F":"+1", "S":"+0", "A":"10", "W":"+0", "H":"6", "notes":"Animal, Pack Hunter"},
	"Small Construct":{"M":"6", "F":"+1", "S":"+0", "A":"11", "W":"+0", "H":"10", "notes":"Construct"},
	"Medium Construct":{"M":"5", "F":"+3", "S":"+0", "A":"12", "W":"+0", "H":"12", "notes":"Construct"},
	"Large Construct":{"M":"4", "F":"+4", "S":"+0", "A":"13", "W":"+0", "H":"14", "notes":"Construct, Large, +2 damage"},
	"Imp":{"M":"6", "F":"+1", "S":"+0", "A":"10", "W":"+4", "H":"6", "notes":"Demon"},
	"Minor Demon":{"M":"6", "F":"+3", "S":"+0", "A":"11", "W":"+4", "H":"12", "notes":"Demon"},
	"Major Demon":{"M":"6", "F":"+5", "S":"+0", "A":"12", "W":"+6", "H":"15", "notes":"Demon, Large, +2 damage, Immune to Invisibility, Beauty, destroys Illusionary Soldiers on contact"},
	"Frost Giant":{"M":"6", "F":"+5", "S":"+0", "A":"15", "W":"+4", "H":"25", "notes":"Takes 2 less elemental damage, Large, +2 damage"},
	"Giant Worm":{"M":"7", "F":"+4", "S":"+0", "A":"10", "W":"+5", "H":"20", "notes":"Large, Can move through terrain, Ignores rough ground movement penalty"},
	"Snow Troll":{"M":"4", "F":"+4", "S":"+0", "A":"14", "W":"+2", "H":"16", "notes":"Large, +2 damage"},
	"Werewolf":{"M":"7", "F":"+4", "S":"+0", "A":"11", "W":"+5", "H":"12", "notes":"Bounty(20gc), Expert Climber"},
	"Armored Skeleton":{"M":"6", "F":"+2", "S":"+0", "A":"12", "W":"+0", "H":"1", "notes":"Pack Hunter, Undead"},
	"Animated Skull":{"M":"6", "F":"+0", "S":"+0", "A":"10", "W":"-2", "H":"1", "notes":"Levitate, Undead"},
	"Ghoul":{"M":"6", "F":"+2", "S":"+0", "A":"10", "W":"+2", "H":"10", "notes":"Undead"},
	"Skeleton":{"M":"6", "F":"+1", "S":"+0", "A":"10", "W":"+0", "H":"1", "notes":"Undead"},
	"Skeleton Archer":{"M":"6", "F":"+0", "S":"+0", "A":"10", "W":"+0", "H":"1", "notes":"Undead, Bow"},
	"Vampire":{"M":"7", "F":"+4", "S":"+0", "A":"12", "W":"+5", "H":"14", "notes":"Immune to non-magic, Attacks count as Magic, Immune to Control, Immune to Invisibility, Beauty, destroys Illusionary Soldiers on contact, Undead"},
	"Wraith":{"M":"6", "F":"+2", "S":"+0", "A":"10", "W":"+3", "H":"6", "notes":"Immaterial, Immune to non-magic, Attacks count as Magic, x2 damage, Undead"},
	"Zombie":{"M":"4", "F":"+1", "S":"+0", "A":"12", "W":"+0", "H":"6", "notes":"Undead"},
}
var _base_game_encounter_table := {
	"minor":["Skeleton", "Skeletons2", "Armored Skeleton", "Zombie", "Zombies2", "Ghoul", "Bear", "Boar", "Giant Rat", "Giant Rats2", "Giant Rats4", "Ice Spider", "Snow Leopard", "Wild Dog", "Wild Dogs2", "Wolf", "Wolves2", "Small Construct", "Imp", "Ice Toad"],
	"medium":["Armored Skeletons2", "Ghoul", "Ghouls2", "Wraith", "Boar", "Boar", "Bear", "Bear", "Ice Spider", "Ice Spiders2", "Snow Leopard", "White Gorilla", "Wolves2", "Medium Construct", "Minor Demon", "Ice Toad", "Ice Toads2", "Snow Troll", "Giant Worm", "Werewolf"],
	"major":["Armored Skeletons3", "Ghoul", "Ghouls2", "Ghouls3", "Wraith", "Wraith", "Vampire", "White Gorilla", "White Gorilla", "Large Construct", "Large Construct", "Minor Demon", "Minor Demon", "Frost Giant", "Snow Troll", "Snow Trolls2", "Werewolf", "Giant Worm", "Giant Worm"]
}
var _lich_lord_encounter_table := {
	"minor":["Skeleton", "Skeletons2", "Armored Skeletons2", "Zombies2", "Zombies3", "Ghouls3", "Frost Wraith", "Boar", "Giant Rat", "Giant Rats2", "Rangifer", "Ice Spider", "Snow Leopard", "Zombie Troll", "Wild Dogs2", "Wolf", "Wraith", "Small Construct", "Imp", "Wraith Knight"],
	"medium":["Armored Skeletons2", "Ghoul", "Ghouls2", "Frost Wraith", "Wraith", "Bear", "Spectre", "Boar", "Ice Spider", "Death Cultists4", "Snow Leopard", "Rangifers2", "Banshee", "Medium Construct", "Minor Demon", "Ice Toad", "Wraith Knight", "Zombie Troll", "Giant Worm", "Ghoul King"],
	"major":["Armored Skeletons3", "Death Cultists4", "Ghouls3", "Ghouls3", "Rangifers3", "Wraith", "Vampire", "Zombie Troll", "White Gorilla", "Spectre", "Large Construct", "Minor Demon", "Frost Wraiths2", "Banshee", "Snow Troll", "Wraith Knight", "Snow Trolls2", "Werewolf", "Ghoul King", "Lich Lord"]
}
var _compilation_encounter_table := {
	"minor":["Skeleton", "Skeletons2", "Armored Skeleton", "Ice Toad", "Ghoul", "Zombies2", "Frost Wraith", "Boar", "Giant Rat", "Giant Rats2", "Rangifer", "Ice Spider", "Snow Leopard", "Snow Troll", "Wild Dogs2", "Wolf", "Wolves2", "Wraith", "Small Construct", "Wraith Knight"],
	"medium":["Fire-Flinger", "Burning Skeleton", "Armored Skeletons2", "Ghoul", "Ghouls2", "Frost Wraith", "Wraith", "Foulhorn", "Bear", "Spectre", "Snow Leopard", "Ice Toad", "Rangifers2", "Banshee", "Medium Construct", "Minor Demon", "Wraith Knight", "Snow Troll", "Giant Worm", "Nullman"],
	"major":["Fire-Flinger", "Burning Skeletons2", "Starfire Elemental", "Foulhorn", "Nullmen2", "Armored Skeletons3", "Ghouls3", "Wraith", "Spectre", "Banshee", "Rangifers3", "Vampire", "Snow Troll", "Large Construct", "Minor Demon", "White Gorillas2", "Giant Worm", "Burning Skeletons3", "Wraith Knight", "Frost Giant"]
}
var _expansion = Table.BASE
var _screen_size:Vector2
onready var _encounter := $EncounterItems
onready var _treasure := $TreasureLabel
onready var _elevel := $EncounterItems/EncounterStrength
onready var _snow := $Background/CPUParticles2D
onready var _snowtimer := $Background/ParticleLocationVarianceTimer

func _ready():
	_screen_size = get_viewport_rect().size
	randomize()
	$Expansions.select(0)
	var _flakes_per_second = _snow.lifetime/_snow.amount
	_snowtimer.start(_flakes_per_second)

func _on_TreasureButton_pressed():
	$Treasure.play()
	_encounter.visible = false
	_treasure.visible = true
	var you_found := ""
	var treasure := []
	if _expansion != Table.LICH:
		if _expansion == Table.BASE:
			var treasure_table := _base_game_treasure_table
			var treasure_index := d(20)
			treasure = treasure_table[treasure_index]
		elif _expansion == Table.COMP:
			var treasure_table := _dark_alchemy_treasure_table
			var treasure_index := d(20)
			treasure = treasure_table[treasure_index]
		for item in treasure:
			var value := ""
			if item["type"] == "coins":
				value = str(item["qty"])
				you_found += (value+"gc")+(", " if treasure.size() > 1 else ".")+"\n"
			elif item["type"] == "rand10":
				value = str((d(20)+1)*10)
				you_found += (value+"gc")+(", " if treasure.size() > 1 else ".")+"\n"
			elif item["type"] == "rand20":
				value = str((d(20)+1)*20)
				you_found += (value+"gc")+(", " if treasure.size() > 1 else ".")+"\n"
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
						you_found += "SCROLL OF "+spell.to_upper()+" "
					elif item["type"] == "grimoire":
						var spell := _generate_spell()
						you_found += "GRIMOIRE OF "+spell.to_upper()+" "
					you_found += "\n"
	elif _expansion == Table.LICH:
		var item:String = _lich_lord_treasure[d(20)]
		if item != "Ivory Scroll":
			you_found = item
		else:
			you_found = "Ivory Scroll of "+_generate_spell()+": An Ivory Scroll may be used once per game. When used, roll a die. On a 19-20, the scroll is destroyed. sell: 200"
	_treasure.text = you_found

func splice(item:Dictionary)->String:
	var spliced := ""
	spliced += item["name"].to_upper()+": "
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

func _on_Expansions_item_selected(index):
	if index == 0:
		_expansion = Table.BASE
	elif index == 1:
		_expansion = Table.LICH
	elif index == 2:
		_expansion = Table.COMP

func _on_Monster_pressed():
	$Encounter.play()
	_encounter.visible = true
	_treasure.visible = false
	var table:Dictionary
	match _expansion:
		Table.BASE:
			table = _base_game_encounter_table
		Table.LICH:
			table = _lich_lord_encounter_table
		Table.COMP:
			table = _compilation_encounter_table
	var level_number := d(20)+1
	var level:String
	if level_number < 13:
		level = "minor"
	elif level_number > 18: 
		level = "major"
	else:
		level = "medium"
	_elevel.text = level.to_upper()+" ENCOUNTER"
	var level_table:Array = table[level]
	var die_size = level_table.size()
	var monster_name:String = level_table[d(die_size)]
	var qty := ""
	var search_for := monster_name
	if search_for != "Lich Lord":
		if monster_name.ends_with("2") or monster_name.ends_with("3") or monster_name.ends_with("4"):
			qty = get_last(monster_name)
			monster_name.erase(monster_name.length()-1, 1)
			search_for = monster_name
		if search_for == "Wolves":
			search_for = "Wolf"
		if search_for == "Nullmen":
			search_for = "Nullman"
		elif search_for.ends_with("s"):
			search_for.erase(search_for.length()-1, 1)
		var monster:Dictionary = _monsters[search_for]
		$EncounterItems/Name.text = qty+" "+monster_name
		var stats := ["M", "F", "S", "A", "W", "H"]
		for stat in stats:
			get_node("EncounterItems/GridContainer/"+stat).text = monster[stat]
		$EncounterItems/Notes.text = monster["notes"]

func get_last(string:String)->String:
	var last_char := ""
	for c in string:
		if string.find_last(c) == string.length()-1:
			last_char = c
			break
	return last_char

func _on_ParticleLocationVarianceTimer_timeout():
	_snow.position.x = rand_range(0, _screen_size.x)
