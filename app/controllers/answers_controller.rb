class AnswersController < ApplicationController
  include ApplicationHelper

  def create
    unless logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
      return
    end
    @question = Question.find_by(id: params[:id])
    @answer = @question.answers.build(answer_params)
    @answer.author_id = current_user.id

    flash[:error] = @answer.errors.full_messages unless @answer.save
    redirect_to @question
  end

  def edit
    unless logged_in?
      flash[:error] = "You must be logged in to do that!"
      redirect_to users_path
      return
    end
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question
    if @answer.author_id != current_user.id
      flash[:error] = "you are not the author of this answer"
      redirect_to @question
    end
  end

  def update
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question

    @answer.update_attributes(answer_params)
    if @answer.save
      redirect_to @question
    else
      flash[:error] = @answer.errors.full_messages
      redirect_to edit_answer_url(@answer)
    end
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    @answer.destroy
    redirect_to question_url(@answer.question)
  end

  def upvote
    @answer = Answer.find_by(id: params[:id])
    unless @answer.voted_by_current_user?(voter: current_user, up: true)
      @answer.upvote(session[:user_id]) if logged_in?
    end
    unless request.xhr?
      redirect_to :back unless request.xhr?
    else
      render partial: "questions/votes", locals: {question: @answer.question}
    end
  end

  def downvote
    @answer = Answer.find_by(id: params[:id])
    unless @answer.voted_by_current_user?(voter: current_user, up: false) 
      @answer.downvote(session[:user_id]) if logged_in?
    end
    unless request.xhr?
      redirect_to :back unless request.xhr?
    else
      render partial: "questions/votes", locals: {question: @answer.question}
    end
  end


  private

  def answer_params
   params.require(:answer).permit(:content)
  end

  def vote_params
    params.require(:vote).permit(:up_or_down)
  end

end
