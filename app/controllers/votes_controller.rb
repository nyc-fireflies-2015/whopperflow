class VotesController < ApplicationController

  def up_vote
    votable  = case params[:type]
                   when "Answer"
                    Answer.find_by(id: params[:id])
                   when "Question"
                    Question.find_by(id: params[:id])
                   end
    attributes = vote_params.merge(voter_id: session[:user_id])
    @vote = votable.votes.build(attributes)
    @question = @vote.associated_question
    flash[:error] = "can't vote again" unless @vote.save
    redirect_to @question
  end

  private

  def vote_params
    params.require(:vote).permit(:up_or_down)
  end
end
