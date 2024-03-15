class CreateQuizzes < ActiveRecord::Migration[7.1]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.string :category
      t.string :description
      t.date :created_date
      t.integer :total_score_possible
      t.string :created_by

      t.timestamps
    end
  end
end
