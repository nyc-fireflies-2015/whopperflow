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
    if !logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
      return
    end
    @question = Question.new()
  end

  def create
    if !logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
      return
    end
    user = current_user
    @question = user.questions.new(question_params)

    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def edit
    if !logged_in?
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
      render :edit
    end

  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
