class DoQuizController < ApplicationController
  def create
  end

  def do_quiz_params
    params.permit(:user_id, :quiz_id, :completed_status)
  end
end
