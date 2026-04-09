class SpellbookEntery < ApplicationRecord
  belongs_to :spellbook
  belongs_to :spell
end
