# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_10_223428) do
  create_table "categories", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.string "category"
    t.string "category_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_categories_on_quiz_id"
  end

  create_table "do_quiz_answers", force: :cascade do |t|
    t.integer "do_quiz_id", null: false
    t.integer "question_id", null: false
    t.string "answer_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["do_quiz_id"], name: "index_do_quiz_answers_on_do_quiz_id"
    t.index ["question_id"], name: "index_do_quiz_answers_on_question_id"
  end

  create_table "do_quizzes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "quiz_id", null: false
    t.boolean "completed_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_do_quizzes_on_quiz_id"
    t.index ["user_id"], name: "index_do_quizzes_on_user_id"
  end

  create_table "question_options", force: :cascade do |t|
    t.integer "question_id", null: false
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "quiz_id", null: false
    t.integer "score"
    t.string "question_type"
    t.string "prompt"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.string "description"
    t.date "created_date"
    t.integer "total_score_possible"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_quizzes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "location"
    t.integer "total_points"
    t.text "bio"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.string "password_digest"
  end

  add_foreign_key "categories", "quizzes"
  add_foreign_key "do_quiz_answers", "do_quizzes"
  add_foreign_key "do_quiz_answers", "questions"
  add_foreign_key "do_quizzes", "quizzes"
  add_foreign_key "do_quizzes", "users"
  add_foreign_key "question_options", "questions"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quizzes", "users"
end
