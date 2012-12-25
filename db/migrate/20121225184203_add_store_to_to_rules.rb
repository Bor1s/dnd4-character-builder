class AddStoreToToRules < ActiveRecord::Migration
  def change
    add_column :rules, :store_to, :string
  end
end
