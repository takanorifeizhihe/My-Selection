class Movie < ApplicationRecord
  #has_many :posts, dependent: :destroy
  # belongs_to :genre
  has_many :favorites, dependent: :destroy
  has_many :movie_comments, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_one_attached:image

  def avg_score
    unless self.reviews.empty?
      reviews.average(:star).round(-1)
    else
      0.0
    end
  end

 def avg_score_percentage
   unless self.reviews.empty?
     reviews.average(:star).round(-1).to_f*100/5
   else
     0.0
   end
 end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end

