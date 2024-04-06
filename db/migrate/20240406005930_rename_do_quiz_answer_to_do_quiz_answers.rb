class RenameDoQuizAnswerToDoQuizAnswers < ActiveRecord::Migration[7.1]
  def change
    rename_table :do_quiz_answer, :do_quiz_answers 
    # I was trying to rename the model do_quiz_answer to do quiz answer
  end
end
