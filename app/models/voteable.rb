module Voteable
  def upvote(voter_id)
    self.votes.create(voter_id: voter_id, up: true)
  end
  def downvote(voter_id)
    self.votes.create(voter_id: voter_id, up: false)
  end
end