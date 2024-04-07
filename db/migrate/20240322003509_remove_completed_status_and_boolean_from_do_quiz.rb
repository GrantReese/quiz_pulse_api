class RemoveCompletedStatusAndBooleanFromDoQuiz < ActiveRecord::Migration[7.1]
  def change
    remove_column :do_quizzes, :boolean
  end
end
