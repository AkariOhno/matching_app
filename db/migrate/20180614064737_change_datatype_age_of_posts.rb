class ChangeDatatypeAgeOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :age, :string
  end
end
