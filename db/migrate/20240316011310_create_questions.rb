class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.integer :score
      t.string :question_type
      t.string :prompt
      t.string :answer

      t.timestamps
    end
  end
end
