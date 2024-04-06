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
        # quiz = @current_user.do_quiz.create(quiz_params) 
        # if quiz.save
        #     render json: quiz, status: :created
        # else
        #     render json: quiz.errors, status: :unprocessable_entity
        # end
        # @user = current_user
        # @quiz = Quiz.create(quiz_params)
        # if @quiz.save
        #     @user.do_quiz.create(quiz: @quiz)
        #     render json: @quiz, status: :created
        # else
        #     render json: @quiz.errors, status: :unprocessable_entity
        # end
        def create
            # Find the user for whom you're creating the quiz
            user = User.find(params[:user_id])
        
            # Create the quiz
            quiz = Quiz.new(quiz_params)
        
            if quiz.save
              # Associate the quiz with the user through DoQuiz
              user.quizzes << quiz
              
              render json: quiz, status: :created
            else
              render json: quiz.errors, status: :unprocessable_entity
            end
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






