class DoQuizAnswersController < ApplicationController
    before_action :set_do_quiz_answers, only: [:show, :destroy]
    before_action :authenticate_request, except: [:index, :show, :create]


    def index
        do_quiz_answers = DoQuizAnswers.all

        render json: do_quiz_answers, status: 200
    end

    def show
        render json: @do_quiz_answers, status: 200
    
    end

    def create 
        # do_quiz_answers = @current_user.do_quiz_answers.create(do_quiz_answers_params)
        do_quiz_answers = DoQuizAnswers.create(do_quiz_answers_params)
        if do_quiz_answers.save
            render json: do_quiz_answers, status: :created
        else
            render json: do_quiz_answers.errors, status: :unprocessable_entity
        end

    end

    def destroy
        if @do_quiz_answers.destroy
            render json: nil, status: :ok
        else
            render json: @do_quiz_answers.errors, status: :unprocessable_entity
        end
    end







    private
    def set_do_quiz_answers
        @do_quiz_answers = DoQuizAnswers.find(params[:id])

    end

    def do_quiz_answers_params
        params.permit(:do_quiz_id, :question_id, :answer_value)
    end


end
