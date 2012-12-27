class AddTodoToRules < ActiveRecord::Migration
  def change
    add_column :rules, :todo, :text
    remove_column :rules, :performs
    remove_column :rules, :as_soon_as
  end
end
