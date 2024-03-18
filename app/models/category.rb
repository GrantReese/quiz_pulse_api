class Category < ApplicationRecord
  validates :name, presence: true 
  validates :category_description, length: { minimum: 3, maximum: 1000 }
  
  
  
  
  belongs_to :quiz
end
