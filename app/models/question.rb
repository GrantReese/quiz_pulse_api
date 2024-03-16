class Question < ApplicationRecord
  validates :score, presence: true
  validates :question_type, presence: true
  validates :prompt, presence: true
  validates :answer, presence: true
  
  
  
  
  belongs_to :quiz
end
