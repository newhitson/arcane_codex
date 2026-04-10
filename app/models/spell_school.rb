class SpellSchool < ApplicationRecord
    has_many :spells
    validates :name, presence: true, uniqueness: true
end
