class Genre < ApplicationRecord
  
  has_many :movies, dependent: :destroy
  has_many :other_conts, dependent: :destroy
end
