class DoQuizAnswer < ApplicationRecord
  belongs_to :do_quiz
  belongs_to :question
end
