class QuizzesController < ApplicationController
    before_action :set_quiz, only: [:show, :destroy]
    before_action :authenticate_request, except: [:index]

    def index
        quizzes = Quiz.all
    
        render json: quizzes, status: 200
    end

    def show
        render json: @quiz, status: 200

    end

    
    def create
            
            # user = User.find(params[:user_id])
        
            quiz = @current_user.quizzes.create(quiz_params)
            #getting error that there is method for quiz for logged in user?
            # getting error with needing assoc with doquiz, changed user model, unkown attribute userid showing from postman
            
            # quiz = Quiz.new(quiz_params)
        
            if quiz.save
              # Associate the quiz with the user through DoQuiz
            #   user.quizzes << quiz
              
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
    params.require(:quiz).permit(:title, :category, :description, :total_score_possible)
    
    end
end

