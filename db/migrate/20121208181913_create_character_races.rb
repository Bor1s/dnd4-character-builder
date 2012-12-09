class CreateCharacterRaces < ActiveRecord::Migration
  def change
    create_table :character_races do |t|
      t.string :name
      t.text :description
    end
  end
end
