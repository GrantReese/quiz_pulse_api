class Question < ApplicationRecord
  validates :score, presence: true, numericality: { 
    less_than_or_equal_to: 5,  only_integer: true }

  validates :question_type, presence: true
  validates :prompt, presence: true
  validates :answer, presence: true
  
  
  
  #associations
  belongs_to :quiz
end
