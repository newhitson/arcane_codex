class Spell < ApplicationRecord
    belongs_to :spell_school
    #Verbal (V - chanting), Somatic (S - gestures), and Material (M - physical objects)
  searchkick word_start: [:name, :description],
             searchable: [:name, :description]


    def search_data
        {
            name: name,
            description: description,
            school: spell_school&.name || school,
            level: level,
            classes: classes,
            components: components,
            ritual: ritual,
            concentration: concentration,
            casting_time: casting_time 
        }
    end
    

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
