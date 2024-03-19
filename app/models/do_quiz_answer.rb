class DoQuizAnswer < ApplicationRecord
  
  
  #associations
  belongs_to :do_quiz
  belongs_to :question
end
