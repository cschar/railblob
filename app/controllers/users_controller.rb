
# require 'pry'

class UsersController < ApplicationController

    def new
      #@user sent to form
      @user = User.new
    end

    def create
      @user = User.new(user_params())
      if @user.save
        #rails flash variable hangs around to pass text into view
        flash[:success] = "Welcome to the Sample App!"
        redirect_to user_url(@user)
        # redirect_to @user
      else
        render 'new'
      end
    end

  def show

    @user = User.find(params[:id])
    # binding.pry
    # debugger
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


end
