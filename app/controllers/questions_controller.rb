class QuestionsController < ApplicationController
  include ApplicationHelper

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = Answer.new
  end

  def new
    unless logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
    end
    @question = Question.new()
  end

  def create
    unless logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
      return
    end
    user = current_user
    @question = user.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      flash[:error] = @question.errors.full_messages
      render :new
    end
  end

  def edit
    unless logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
      return
    end
    @question = Question.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:id])

    if @question.update_attributes(question_params)
      redirect_to @question
    else
      flash[:error] = @question.errors.full_messages
      render :edit
    end

  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def upvote
    @question = Question.find_by(id: params[:id])
    unless question_voted_by_current_user?(@question)
      @question.up_vote(session[:user_id])
    end
  end

  def downvote
    @question = Question.find_by(id: params[:id])
    unless question_voted_by_current_user?(@question)
      @question.down_vote(session[:user_id])
    end
  end


  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def vote_params
    params.require(:vote).permit(:up_or_down)
  end

end
