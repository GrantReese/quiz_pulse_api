class CreateDoQuizAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :do_quiz_answers do |t|
      t.references :do_quiz, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.string :answer_value

      t.timestamps
    end
  end
end
