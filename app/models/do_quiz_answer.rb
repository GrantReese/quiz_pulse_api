class DoQuizAnswer < ApplicationRecord
  validates :answer_value, presence: true
  
  #associations
  belongs_to :do_quiz
  belongs_to :question
end
