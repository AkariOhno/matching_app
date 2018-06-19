class AddAnimalToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :animal, :string
  end
end
