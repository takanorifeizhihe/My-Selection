class Post < ApplicationRecord
  belongs_to :other_content
  belongs_to :movie
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
