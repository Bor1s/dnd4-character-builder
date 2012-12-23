class CreateCharacterSkills < ActiveRecord::Migration
  def change
    create_table :character_skills do |t|
  		t.references :character
  		t.references :skill
      t.integer :value, default: 0
  		t.boolean :trained, default: false
    end
  end
end
