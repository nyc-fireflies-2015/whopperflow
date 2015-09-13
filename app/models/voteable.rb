module Voteable
  def upvote(voter_id)
    voter = User.find_by(id: voter_id)
    self.votes.create(voter: voter, up: true)
  end
  def downvote(voter_id)
    voter = User.find_by(id: voter_id)
    self.votes.create(voter: voter, up: false)
  end
  def votes_count
    self.votes.select(&:up).count
  end
end