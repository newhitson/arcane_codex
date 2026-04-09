class Spellbook < ApplicationRecord
    has_many :spellbook_enteries, dependent: :destroy
    has_many :spells, through: :spellbook_entries

    validates :name, presence: true

    def available_spells
        Spell.for_class(character_class)
             .where("level <= ?", max_spell_level)
    end

    def max_spell_level
        #oversimplification
        [(character_level + 1) /2, 9].min
    end
end
