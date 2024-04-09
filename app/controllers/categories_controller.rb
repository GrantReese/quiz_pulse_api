class CategoriesController < ApplicationController
  def index
    categories = Category.all

    render json: questions, status: 200
  end

  def show
    render json: @category, status: 200

  end

  def create 
    category = Category.create(category_params) 
    if category.save
      render json: question, status: :created
    else
      render json: question.errors, status: :unprocessable_entity
  end

  


  private
     def set_category
        @category = Category.find(params[:id])

      end

      def category_params
        params.permit(:category, :category_description, :quiz_id)
      end
end