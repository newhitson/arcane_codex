class Spell < ApplicationRecord
    #Verbal (V - chanting), Somatic (S - gestures), and Material (M - physical objects)

    validates :name, presence: true, uniqueness: true
    validates :level, presence: true,
        numericality: { in: 0..9 }
    validates :school, presence: true,
        inclusion: { in: %w[ Abjuration Conjuration Divination
      Enchantment Evocation Illusion Necromancy Transmutation ] }

    scope :cantrips, -> { where(level: 0) }
    scope :by_school, ->(school) { where(school: school) }
    scope :by_level, ->(level) {where(level: level) }
    scope :ritual, -> { where(ritual: true) }
    scope :concentration, -> { where(concentration: true) } 
    scope :for_class, ->(char_class) {
        where("? = ANY(classes)", char_class)
    }
end
