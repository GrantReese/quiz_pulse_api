class RemoveCompletedStatusFromDoQuizzes < ActiveRecord::Migration[7.1]
  def change
    remove_column :do_quizzes, :completed_status
  end
end
