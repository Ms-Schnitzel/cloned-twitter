class UsersController < ApplicationController
  def create
    # @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    @user = User.create(user_params)
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])


    # render 'users/create.jbuilder'
    if @user.save
      render json: {
        user: {
          username: @user.username,
          email: @user.email
        }
      }
    else
      render json: {
        success: false
      }
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
