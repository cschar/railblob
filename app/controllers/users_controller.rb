
# require 'pry'

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user,   only: [:edit, :update]


  def index
    @users = User.paginate(page: params[:page], :per_page=>5)
    # @users = User.paginate(page: params[:page])
  end

  def show

    @user = User.find(params[:id])
    # binding.pry
    # debugger
  end

  def new
      #@user sent to form
      @user = User.new
    end

  def create
    @user = User.new(user_params())
    if @user.save
      # from session_helper included in application controller
      log_in @user

      #rails flash variable hangs around to pass text into view
      flash[:success] = "Welcome to the Sample App!"

      redirect_to user_url(@user)
      # redirect_to @user
    else
      render 'new'
    end
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Updated profile"
      redirect_to user_url(@user)
    else
      render 'edit'
    end
  end


  # Before filters   ###########################

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location

      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end


end
