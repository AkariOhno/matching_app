class AddColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :gender, :string
    add_column :posts, :age, :integer
    add_column :posts, :breed, :string 
  end
end
