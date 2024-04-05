class DoQuiz < ApplicationRecord
  validates :completed_status, inclusion: { in: [true, false] }
  
  #associations
  belongs_to :user
  belongs_to :quiz
  has_many :do_quiz_answers
end
