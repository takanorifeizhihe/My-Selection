class Movie < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :genre
end
