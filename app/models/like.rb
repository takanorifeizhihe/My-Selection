class Like < ApplicationRecord
  
  belongs_to :user
  belongs_to :other_content
  #belongs_to :movie, optional: true
end
