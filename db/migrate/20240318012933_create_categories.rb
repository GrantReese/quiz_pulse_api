class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :category
      t.string :category_description

      t.timestamps
    end
  end
end
