class DoQuiz < ApplicationRecord
  validates :completed_status, inclusion: { in: [true, false] }
  # enum completed_status: { true_value: 0, false_value: 1 }


  #associations
  belongs_to :user
  belongs_to :quiz
  has_many :do_quiz_answers
end
