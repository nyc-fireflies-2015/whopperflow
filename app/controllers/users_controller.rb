class UsersController < ApplicationController
  include ApplicationHelper

  def index # login page
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create # POST
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def login # POST
    @user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_url(@user)
    else
      flash[:error] = 'incorrect username or password'
      redirect_to users_path
    end
  end

  def show # profile
    if !logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
      return
    end
    @user = User.find_by(id: session[:user_id]) #check a better way to do this
  end

  def destroy # logout
    if current_user
      session.clear
    end
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
