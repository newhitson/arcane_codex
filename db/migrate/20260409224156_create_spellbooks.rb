class CreateSpellbooks < ActiveRecord::Migration[7.2]
  def change
    create_table :spellbooks do |t|
      t.string :name
      t.string :character_class
      t.integer :character_level

      t.timestamps
    end
  end
end
