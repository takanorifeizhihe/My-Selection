class OtherContent < ApplicationRecord

  belongs_to :genre
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :othercontent_comments, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  has_one_attached:image

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
