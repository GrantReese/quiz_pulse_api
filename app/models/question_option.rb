class QuestionOption < ApplicationRecord
  validates :value, presence: true
  
  belongs_to :question
end
