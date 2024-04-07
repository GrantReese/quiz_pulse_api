class CreateDoQuizzes < ActiveRecord::Migration[7.1]
  def change
    create_table :do_quizzes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.string :completed_status
      t.string :boolean

      t.timestamps
    end
  end
end
