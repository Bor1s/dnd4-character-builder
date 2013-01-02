class CreateCharacterLanguages < ActiveRecord::Migration
  def change
    create_table :characters_languages, id: false do |t|
      t.references :character
      t.references :language
    end
  end
end
