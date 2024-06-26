# laptop needs masterkey for auth to go in config folder

class QuestionsController < ApplicationController
    before_action :set_question, only: [:show, :destroy]
    before_action :authenticate_request, except: [:index, :show]

    def index
        questions = Question.all
    
        render json: questions, status: 200
    end

    def show
        render json: @question, status: 200

    end

    def create 
        question = Question.create(question_params) 
        if question.save
            render json: question, status: :created
        else
            render json: question.errors, status: :unprocessable_entity
        end
        
    end
   

    def destroy
        if @question.destroy
            render json: nil, status: :ok
        else
            render json: @question.errors, status: :unprocessable_entity
        end
    end
    

    private
    def set_question
        @question = Question.find(params[:id])

    end

    # def question_params
    # params.permit(:score, :question_type, :prompt, :answer, :quiz_id)
    # end
    def question_params
        params.require(:question).permit(:score, :question_type, :prompt, :answer, :quiz_id)
      end
      

end








