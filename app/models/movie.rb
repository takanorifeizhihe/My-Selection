class Movie < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :genre
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

