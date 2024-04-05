class DoQuizController < ApplicationController
  before_action :set_do_quiz, only: [ :show, :destroy ]
  before_action :authenticate_request, except: [:index, :show, :create, :destroy]

  def index
    do_quizzes = DoQuiz.all

    render json: do_quizzes, status: 200
  end

  def show
    
    render json: @do_quiz, status: 200
  end

  def create
    # do_quiz = @current_user.do_quizzes.create(do_quiz_params)
    do_quiz = DoQuiz.create(do_quiz_params)
    if do_quiz.save
      render json: do_quiz, status: :created
    else
      render json: do_quiz.errors, status: :unprocessable_entity
    end
  end

  def destroy
    
    if @do_quiz.destroy
      render json: nil, status: :ok
    else
      render json: do_quiz.errors, status: :unprocessable_entity
    end
  end
  
  private 

  def set_do_quiz
    do_quiz = DoQuiz.find(params[:id])
  end

  def do_quiz_params
    params.permit(:user_id, :quiz_id, :completed_status)
  end
end
