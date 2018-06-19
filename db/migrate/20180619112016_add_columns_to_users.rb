class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :prefecture, :string
    add_column :users, :city, :string
    add_column :users, :job, :string
    add_column :users, :family, :string
  end
end
