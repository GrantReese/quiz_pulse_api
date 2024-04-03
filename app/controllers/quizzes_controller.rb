class QuizzesController < ApplicationController
    before_action :set_quiz, only: [:show, :destroy]
    before_action :authenticate_request, except: [:index,]

    def index
        quizzes = Quiz.all
    
        render json: quizzes, status: 200
    end

    def show
        render json: @quiz, status: 200

    end

    def create 
        quiz = @current_user.quizzes.new(quiz_params) #codeim suggests quiz .build
        if quiz.save
            render json: quiz, status: :created
        else
            render json: quiz.errors, status: :unprocessable_entity
        end
        
    end
   

    def destroy
        if @quiz.destroy
            render json: nil, status: :ok
        else
            render json: @quiz.errors, status: :unprocessable_entity
        end
    end
    

    private
    def set_quiz
        @quiz = Quiz.find(params[:id])

    end

    def quiz_params
    params.permit(:title, :category, :description, :total_score_possible, :created_by)
    end
end






