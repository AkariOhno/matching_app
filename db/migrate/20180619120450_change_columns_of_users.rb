class ChangeColumnsOfUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :family, :string
    add_column :users, :family_adult, :integer
    add_column :users, :family_child, :integer
  end
end
