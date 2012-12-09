class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.text :ability_scores
      t.text :defences
      t.integer :character_class_id
      t.integer :character_race_id
      t.integer :level
      t.integer :expirience
    end
  end
end
