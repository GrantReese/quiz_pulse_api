class UsersController < ApplicationController
before_action :set_user, only: [:destroy, :update] 
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    

    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end  
  def destroy
   if @user.destroy
    render json: nil, status: :ok
   else
     render json: @user.errors, status: :unprocessable_entity
   end

  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.permit(:username, :email, :location, :first_name, :last_name, :password, :password_confirmation)
  end
end
