class CommentsController < ApplicationController

  def new
    binding.pry
    @comment = Comment.new
    @type = params[:type]
  end

  def create
    binding.pry
    commentable  = case params[:type]
                   when "Answer"
                    Answer.find_by(id: params[:id])
                   when "Question"
                    Question.find_by(id: params[:id])
                   end
    attributes = comment_params.merge(author_id: session[:user_id])
    @comment = commentable.comments.build(attributes)
    @question = @comment.associated_question
    flash[:error] = "incorrect comment format" unless @comment.save
    redirect_to @question
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
    @question = @comment.associated_question

    if @comment.author_id != session[:user_id]
      flash[:error] = "you are not the author of this comment"
      redirect_to @question
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @question = comment.associated_question
    @comment.update_attributes(comment_params)

    if @comment.save
      redirect_to @question
    else
      flash[:error] = "incorrect comment format"
      redirect_to edit_comment_url(@comment)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to question_url(@comment.question)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id)
  end

end
