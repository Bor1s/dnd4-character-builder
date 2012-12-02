class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :name
      t.text :performs
      t.text :as_soon_as
    end
  end
end
