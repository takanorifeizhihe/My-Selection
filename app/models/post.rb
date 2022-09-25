class Post < ApplicationRecord
  belongs_to :other_content
  belongs_to :movie
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy

   def avg_score
    unless self.posts.empty?
      posts.average(:star_id).round(1)
    else
      0.0
    end
   end

 def avg_score_percentage
   unless self.posts.empty?
     posts.average(:star_id).round(1).to_f*100/5
   else
     0.0
   end
 end


  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
