class AddRootToRules < ActiveRecord::Migration
  def change
    add_column :rules, :root, :boolean, default: false
  end
end
