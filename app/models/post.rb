class Post < ApplicationRecord
  validates :name, {presence: true}
  validates :gender, {presence: true}
  validates :age, {presence: true}
  validates :breed, {presence: true}
  validates :content, {presence: true, length: {maximum: 140}}
  validates :user_id, {presence: true}
end
