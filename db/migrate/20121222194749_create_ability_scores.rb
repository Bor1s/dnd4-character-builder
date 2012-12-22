class CreateAbilityScores < ActiveRecord::Migration
  def change
    create_table :ability_scores do |t|
      t.string :name
      t.integer :value, default: 0
      t.references :character
    end
  end
end
