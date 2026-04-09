class CreateSpellbookEnteries < ActiveRecord::Migration[7.2]
  def change
    create_table :spellbook_enteries do |t|
      t.references :spellbook, null: false, foreign_key: true
      t.references :spell, null: false, foreign_key: true
      t.boolean :prepared

      t.timestamps
    end
  end
end
