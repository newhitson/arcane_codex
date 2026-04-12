Spellbook.destroy_all
Spell.destroy_all
SpellSchool.destroy_all

spell_schools = [
  {
    name: "Evocation",
    description: "The school of raw magical power, focused on channeling energy to create effects such as fire, lightning, cold, and force. Evokers are the classic battle mages, bending the elements to their will.",
    color: "#E24B4A"
  },
  {
    name: "Abjuration",
    description: "The school of protection and warding. Abjurers specialize in spells that block, banish, and shield, creating magical barriers and dispelling the magic of others.",
    color: "#378ADD"
  },
  {
    name: "Divination",
    description: "The school of sight and knowledge. Diviners peer through time and space to uncover secrets, predict the future, and reveal that which is hidden from ordinary perception.",
    color: "#FAC775"
  },
  {
    name: "Transmutation",
    description: "The school of transformation. Transmuters alter the physical properties of objects, creatures, and the world itself, reshaping matter and energy at will.",
    color: "#639922"
  },
  {
    name: "Illusion",
    description: "The school of deception and trickery. Illusionists weave phantasms of sight, sound, smell, and sensation to confound enemies and delight allies.",
    color: "#7F77DD"
  },
  {
    name: "Enchantment",
    description: "The school of the mind. Enchanters influence and control the thoughts, emotions, and behavior of others, bending wills with subtle or overwhelming magical force.",
    color: "#D4537E"
  },
  {
    name: "Conjuration",
    description: "The school of summoning and teleportation. Conjurers call creatures and objects from elsewhere, create matter from nothing, and teleport themselves and others across vast distances.",
    color: "#1D9E75"
  },
  {
    name: "Necromancy",
    description: "The school of life, death, and undeath. Necromancers manipulate the forces of mortality, draining life energy from the living and animating the remains of the dead.",
    color: "#888780"
  }
]
spell_schools.each { |spell_school| SpellSchool.create!(spell_school)}
puts "#{SpellSchool.count} spell schools created!"

spells = [
  {
    name: "Fireball",
    level: 3,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 action",
    range: "150 feet",
    duration: "Instantaneous",
    description: "A bright streak flashes from your pointing finger to a point you choose within range, then blossoms with a low roar into an explosion of flame.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Magic Missile",
    level: 1,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 action",
    range: "120 feet",
    duration: "Instantaneous",
    description: "You create three glowing darts of magical force. Each dart hits a creature of your choice that you can see within range.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Wizard"],
    components: ["V", "S"]
  },
  {
    name: "Cure Wounds",
    level: 1,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 action",
    range: "Touch",
    duration: "Instantaneous",
    description: "A creature you touch regains a number of hit points equal to 1d8 + your spellcasting ability modifier.",
    ritual: false,
    concentration: false,
    classes: ["Bard", "Cleric", "Druid", "Paladin", "Ranger"],
    components: ["V", "S"]
  },
  {
    name: "Shield",
    level: 1,
    school: "Abjuration",
    spell_school_id: SpellSchool.find_by!(name: "Abjuration").id,
    casting_time: "1 reaction",
    range: "Self",
    duration: "1 round",
    description: "An invisible barrier of magical force appears and protects you, giving +5 bonus to AC until the start of your next turn.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Wizard"],
    components: ["V", "S"]
  },
  {
    name: "Detect Magic",
    level: 1,
    school: "Divination",
    spell_school_id: SpellSchool.find_by!(name: "Divination").id,
    casting_time: "1 action",
    range: "Self",
    duration: "10 minutes",
    description: "For the duration, you sense the presence of magic within 30 feet. You can use your action to see a faint aura around visible magical creatures or objects.",
    ritual: true,
    concentration: true,
    classes: ["Bard", "Cleric", "Druid", "Paladin", "Ranger", "Sorcerer", "Wizard"],
    components: ["V", "S"]
  },
  {
    name: "Counterspell",
    level: 3,
    school: "Abjuration",
    spell_school_id: SpellSchool.find_by!(name: "Abjuration").id,
    casting_time: "1 reaction",
    range: "60 feet",
    duration: "Instantaneous",
    description: "You attempt to interrupt a creature in the process of casting a spell. Automatically interrupts spells of 3rd level or lower.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Warlock", "Wizard"],
    components: ["S"]
  },
  {
    name: "Polymorph",
    level: 4,
    school: "Transmutation",
    spell_school_id: SpellSchool.find_by!(name: "Transmutation").id,
    casting_time: "1 action",
    range: "60 feet",
    duration: "1 hour",
    description: "This spell transforms a creature that you can see within range into a new form. An unwilling creature must make a Wisdom saving throw to resist.",
    ritual: false,
    concentration: true,
    classes: ["Bard", "Druid", "Sorcerer", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Fly",
    level: 3,
    school: "Transmutation",
    spell_school_id: SpellSchool.find_by!(name: "Transmutation").id,
    casting_time: "1 action",
    range: "Touch",
    duration: "10 minutes",
    description: "You touch a willing creature. The target gains a flying speed of 60 feet for the duration.",
    ritual: false,
    concentration: true,
    classes: ["Sorcerer", "Warlock", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Invisibility",
    level: 2,
    school: "Illusion",
    spell_school_id: SpellSchool.find_by!(name: "Illusion").id,
    casting_time: "1 action",
    range: "Touch",
    duration: "1 hour",
    description: "A creature you touch becomes invisible until the spell ends. Anything the target is wearing or carrying is invisible as long as it is on the target's person.",
    ritual: false,
    concentration: true,
    classes: ["Bard", "Sorcerer", "Warlock", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Hold Person",
    level: 2,
    school: "Enchantment",
    spell_school_id: SpellSchool.find_by!(name: "Enchantment").id,
    casting_time: "1 action",
    range: "60 feet",
    duration: "1 minute",
    description: "Choose a humanoid that you can see within range. The target must succeed on a Wisdom saving throw or be paralyzed for the duration.",
    ritual: false,
    concentration: true,
    classes: ["Bard", "Cleric", "Druid", "Sorcerer", "Warlock", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Lightning Bolt",
    level: 3,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 action",
    range: "Self (100-foot line)",
    duration: "Instantaneous",
    description: "A stroke of lightning forming a line 100 feet long and 5 feet wide blasts out from you in a direction you choose.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Misty Step",
    level: 2,
    school: "Conjuration",
    spell_school_id: SpellSchool.find_by!(name: "Conjuration").id,
    casting_time: "1 bonus action",
    range: "Self",
    duration: "Instantaneous",
    description: "Briefly surrounded by silvery mist, you teleport up to 30 feet to an unoccupied space that you can see.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Warlock", "Wizard"],
    components: ["V"]
  },
  {
    name: "Charm Person",
    level: 1,
    school: "Enchantment",
    spell_school_id: SpellSchool.find_by!(name: "Enchantment").id,
    casting_time: "1 action",
    range: "30 feet",
    duration: "1 hour",
    description: "You attempt to charm a humanoid you can see within range. It must make a Wisdom saving throw, and if it fails, it is charmed by you until the spell ends.",
    ritual: false,
    concentration: false,
    classes: ["Bard", "Druid", "Sorcerer", "Warlock", "Wizard"],
    components: ["V", "S"]
  },
  {
    name: "Animate Dead",
    level: 3,
    school: "Necromancy",
    spell_school_id: SpellSchool.find_by!(name: "Necromancy").id,
    casting_time: "1 minute",
    range: "10 feet",
    duration: "Instantaneous",
    description: "This spell creates an undead servant. Choose a pile of bones or a corpse of a Medium or Small humanoid within range.",
    ritual: false,
    concentration: false,
    classes: ["Cleric", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Wish",
    level: 9,
    school: "Conjuration",
    spell_school_id: SpellSchool.find_by!(name: "Conjuration").id,
    casting_time: "1 action",
    range: "Self",
    duration: "Instantaneous",
    description: "Wish is the mightiest spell a mortal creature can cast. By simply speaking aloud, you can alter the very foundations of reality.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Wizard"],
    components: ["V"]
  },
  {
    name: "Mage Armor",
    level: 1,
    school: "Abjuration",
    spell_school_id: SpellSchool.find_by!(name: "Abjuration").id,
    casting_time: "1 action",
    range: "Touch",
    duration: "8 hours",
    description: "You touch a willing creature who isn't wearing armor, and a protective magical force surrounds it until the spell ends. The target's base AC becomes 13 + its Dexterity modifier.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Healing Word",
    level: 1,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 bonus action",
    range: "60 feet",
    duration: "Instantaneous",
    description: "A creature of your choice that you can see within range regains hit points equal to 1d4 + your spellcasting ability modifier.",
    ritual: false,
    concentration: false,
    classes: ["Bard", "Cleric", "Druid"],
    components: ["V"]
  },
  {
    name: "Darkness",
    level: 2,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 action",
    range: "60 feet",
    duration: "10 minutes",
    description: "Magical darkness spreads from a point you choose within range to fill a 15-foot radius sphere for the duration. Darkvision can't see through this darkness.",
    ritual: false,
    concentration: true,
    classes: ["Sorcerer", "Warlock", "Wizard"],
    components: ["V", "M"]
  },
  {
    name: "Web",
    level: 2,
    school: "Conjuration",
    spell_school_id: SpellSchool.find_by!(name: "Conjuration").id,
    casting_time: "1 action",
    range: "60 feet",
    duration: "1 hour",
    description: "You conjure a mass of thick, sticky webbing at a point of your choice within range. The webs fill a 20-foot cube and are difficult terrain.",
    ritual: false,
    concentration: true,
    classes: ["Sorcerer", "Wizard"],
    components: ["V", "S", "M"]
  },
  {
    name: "Teleport",
    level: 7,
    school: "Conjuration",
    spell_school_id: SpellSchool.find_by!(name: "Conjuration").id,
    casting_time: "1 action",
    range: "10 feet",
    duration: "Instantaneous",
    description: "This spell instantly transports you and up to eight willing creatures of your choice that you can see within range, or a single object that you can see within range, to a destination you select.",
    ritual: false,
    concentration: false,
    classes: ["Bard", "Sorcerer", "Wizard"],
    components: ["V"]
  },
  {
    name: "Fire Bolt",
    level: 0,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 action",
    range: "120 feet",
    duration: "Instantaneous",
    description: "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn't being worn or carried.",
    ritual: false,
    concentration: false,
    classes: ["Sorcerer", "Wizard"],
    components: ["V", "S"]
  },
  {
    name: "Eldritch Blast",
    level: 0,
    school: "Evocation",
    spell_school_id: SpellSchool.find_by!(name: "Evocation").id,
    casting_time: "1 action",
    range: "120 feet",
    duration: "Instantaneous",
    description: "A beam of crackling energy streaks toward a creature within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 force damage. The spell creates more than one beam when you reach higher levels.",
    ritual: false,
    concentration: false,
    classes: ["Warlock"],
    components: ["V", "S"]
  },
  {
    name: "Minor Illusion",
    level: 0,
    school: "Illusion",
   spell_school_id: SpellSchool.find_by!(name: "Illusion").id,
    casting_time: "1 action",
    range: "30 feet",
    duration: "1 minute",
    description: "You create a sound or an image of an object within range that lasts for the duration. A creature that uses its action to examine the sound or image can determine it is an illusion with a successful Intelligence (Investigation) check against your spell save DC.",
    ritual: false,
    concentration: false,
    classes: ["Bard", "Sorcerer", "Warlock", "Wizard"],
    components: ["S", "M"]
  }
]

spellbooks = [
  {
    name: "Necronomicon",
    character_class: "Wizard",
    character_level: 10
  },
  {
    name: "The Greater Key of Solomon",
    character_class: "Sorcerer",
    character_level: 5
  }
]


spells.each { |spell| Spell.create!(spell) }
puts "#{Spell.count} spells created!"
spellbooks.each { |spellbook| Spellbook.create!(spellbook)}
puts "#{Spellbook.count} spellbooks created!"

spellbook_entries = [
  {
    spellbook_id: Spellbook.first.id,
    spell_id: Spell.find_by!(name: "Animate Dead").id,
    prepared: true
  },
  {
    spellbook_id: Spellbook.last.id,
    spell_id: Spell.find_by!(name: "Web").id,
    prepared: true
  },
  {
    spellbook_id: Spellbook.last.id,
    spell_id: Spell.find_by!(name: "Misty Step").id,
    prepared: true
  }
]

spellbook_entries.each { |entry| SpellbookEntery.create!(entry) }
puts "#{SpellbookEntery.count} spellbook entries created!"