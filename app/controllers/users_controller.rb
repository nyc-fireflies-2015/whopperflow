class UsersController < ApplicationController
  def index # login page
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create # POST
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def login # POST
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    p @user
    if @user
      session[:user_id] = @user.id
      redirect_to user_url(@user)
    else
      flash[:error] = 'incorrect username or password'
      redirect_to users_path
    end
  end

  def show # profile
    @user = User.find_by(id: session[:user_id]) #check a better way to do this
  end

  # def logout
  #   @user = User.find_by(id: session[:user_id])
  #   if @user
  #     session.clear
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
