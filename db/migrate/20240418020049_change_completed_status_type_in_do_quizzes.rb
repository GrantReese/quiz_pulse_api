class ChangeCompletedStatusTypeInDoQuizzes < ActiveRecord::Migration[7.1]
  def change
    change_column :do_quizzes, :completed_status, :integer
  end
end
