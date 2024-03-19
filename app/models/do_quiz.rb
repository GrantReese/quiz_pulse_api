class DoQuiz < ApplicationRecord
  
  
  #associations
  belongs_to :user
  belongs_to :quiz
  has_many :do_quiz_answers
end
