class UsersController < ApplicationController
  def index # login page
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create # POST
<<<<<<< c33b997146b818c89b94c490461a85e3a512db84
      @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
=======
    @user = User.build(user_params)
    if @user.save
      redirect_to profile(@user)
    else
      flash[:error] = @user.errors.full_messages
>>>>>>> CRUD user
    end
  end

  def login # POST
    @user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
<<<<<<< c33b997146b818c89b94c490461a85e3a512db84
    p @user
    if @user
      session[:user_id] = @user.id
      redirect_to user_url(@user)
    else
      flash[:error] = 'incorrect username or password'
      redirect_to users_path
=======
    if @user
      session[:user_id] = @user.id
      redirect_to profile(@user)
    else
      flash[:error] = @user.errors.full_messages
>>>>>>> CRUD user
    end
  end

  def show # profile
<<<<<<< c33b997146b818c89b94c490461a85e3a512db84
    @user = User.find_by(id: session[:user_id]) #check a better way to do this
  end

  # def logout
  #   @user = User.find_by(id: session[:user_id])
  #   if @user
  #     session.clear
  #   end
  # end

=======
  end

>>>>>>> CRUD user
  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
