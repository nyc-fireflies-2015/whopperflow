module ApplicationHelper
  extend self

  def logged_in?
    session[:user_id]
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def redirect_to_login_unless_logged_in
    flash[:error] = "You must be logged in to do that!" unless logged_in?
    redirect_to users_path unless logged_in?
  end

  def voted_by_current_user?(element)
    element.votes.any? do |vote|
      vote.voter_id == current_user.id
    end
  end
end
