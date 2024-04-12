class AddUserRefToQuizzes < ActiveRecord::Migration[7.1]
  def change
    add_reference :quizzes, :user, null: true, foreign_key: true
  end
end
