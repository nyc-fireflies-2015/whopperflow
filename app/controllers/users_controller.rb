class UsersController < ApplicationController
  def index # login page
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create # POST
    @user = User.build(user_params)
    if @user.save
      redirect_to profile(@user)
    else
      flash[:error] = @user.errors.full_messages
    end
  end

  def login # POST
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to profile(@user)
    else
      flash[:error] = @user.errors.full_messages
    end
  end

  def show # profile
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
