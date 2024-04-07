class Category < ApplicationRecord
  validates :category, presence: true 
  validates :category_description, length: { minimum: 3, maximum: 1000 }
  
  
  
  #Associations
  
  # belongs_to :quiz
end
