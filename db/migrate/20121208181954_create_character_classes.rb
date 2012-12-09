class CreateCharacterClasses < ActiveRecord::Migration
  def change
    create_table :character_classes do |t|
      t.string :name
      t.integer :hit_points_at_first_level
      t.integer :hit_points_per_level
      t.integer :healing_surges_per_day
      t.integer :trained_skills_count
    end
  end
end
