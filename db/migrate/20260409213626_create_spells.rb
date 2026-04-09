class CreateSpells < ActiveRecord::Migration[7.2]
  def change
    create_table :spells do |t|
      t.string :name, null: false
      t.integer :level, null: false, default: 0
      t.string :school, null: false
      t.string :casting_time
      t.string :range
      t.string :duration
      t.text :description
      t.boolean :ritual, default: false
      t.boolean :concentration, default: false
      t.string :classes, array: true, default: []
      t.string :components, array: true, default: []

      t.timestamps
    end
    
    add_index :spells, :name, unique: true
    add_index :spells, :level
    add_index :spells, :school
    add_index :spells, :classes, using: :gin
  end
end
