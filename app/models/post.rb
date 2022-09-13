class Post < ApplicationRecord
  belongs_to :other_content
  belongs_to :movie
  belongs_to :user
  has_many :likes, dependent: :destroy

end
