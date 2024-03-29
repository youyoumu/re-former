class UsersController < ApplicationController
  def new
    @user = User.new(username: 'your username here' ,email: 'example@example.com')
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    # @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
