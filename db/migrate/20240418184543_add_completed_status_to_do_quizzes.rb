class AddCompletedStatusToDoQuizzes < ActiveRecord::Migration[7.1]
  def change
    add_column :do_quizzes, :completed_status, :boolean, default: false
  end
end
