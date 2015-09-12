class AnswersController < ApplicationController

  def create
    @question = Question.find_by(id: params[:id])
    @answer = @question.answers.build(answer_params)
    binding.pry
    # need to include the helper application
    @answer.author = current_user

    if @answer.save
      redirect_to @question
    else
      flash[:error] = "incorrect answer format"
      redirect_to @question
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
    if @answer.author == current_user
      render edit_answer_path
    else
      flash[:error] = "you are not the author of this answer"
      redirect_to @question
    end
  end

  def update
    @answer = Answer.find_by(id: params[:id])
    @answer.assign_attributes(answer_params)
    if @answer.save
      redirect_to question_url(@answer.question)
    else
      flash[:error] = "incorrect answer format"
      redirect_to edit_answer_url(@answer)
    end
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    @answer.destroy
    redirect_to question_url(@answer.question)
  end

private

def answer_params
 params.require(:answer).permit(:content)
end

end
