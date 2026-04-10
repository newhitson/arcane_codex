class CreateSpellSchools < ActiveRecord::Migration[7.2]
  def change
    create_table :spell_schools do |t|
      t.string :name
      t.text :description
      t.string :color

      t.timestamps
    end
  end
end
