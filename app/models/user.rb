class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  validates :password, length: { minimum: 6 }

  has_many :questions, :foreign_key => :author_id
  has_many :answers, :foreign_key => :author_id
  has_many :comments, :foreign_key => :author_id
  has_many :votes, :foreign_key => :voter_id
end
