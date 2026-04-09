class AddConstraintsToSpells < ActiveRecord::Migration[7.2]
  def change
    add_check_constraint :spells,
      "level >= 0 AND level <= 9",
      name: "spell_level_range"
  end
end
