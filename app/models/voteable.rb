module Voteable
  def upvote(voter_id)
    voter = User.find_by(id: voter_id)
    if voted_by_current_user?(voter, false)
      Vote.where(votable: self).where(voter: voter).delete_all
    end
      self.votes.create(voter: voter, up: true)
  end
  def downvote(voter_id)
    voter = User.find_by(id: voter_id)
    if voted_by_current_user?(voter, true)
      Vote.where(votable: self).where(voter: voter).delete_all
    end
      self.votes.create(voter: voter, up: false)
  end
  def votes_count
    self.votes.select(&:up).count - self.votes.reject(&:up).count
  end
  def voted_by_current_user?(voter, up)
    !Vote.where(votable: self).where(voter: voter).where(up: up).empty?
  end
end