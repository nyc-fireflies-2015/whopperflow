class VotesController < ApplicationController

  private

  def vote_params
    params.require(:vote).permit(:up_or_down)
  end
end
