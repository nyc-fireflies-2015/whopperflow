module Voteable
  def upvote(voter_id)
    voter = User.find_by(id: voter_id)
    if voted_by_current_user?(voter: voter, up: false)
      Vote.where(votable: self).where(voter: voter).delete_all
    end
      self.votes.create(voter: voter, up: true)
  end
  def downvote(voter_id)
    voter = User.find_by(id: voter_id)
    if voted_by_current_user?(voter: voter, up: true)
      Vote.where(votable: self).where(voter: voter).delete_all
    end
      self.votes.create(voter: voter, up: false)
  end
  def votes_count
    self.votes.select(&:up).count - self.votes.reject(&:up).count
  end
  def voted_by_current_user?(args={})
    !Vote.where(votable: self).where(voter: args[:voter]).where(up: args[:up]).empty?
  end
end