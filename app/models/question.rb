class Question < ActiveRecord::Base
  include Voteable
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  has_one :best_answer, class_name: "Answer"
  validates_presence_of :title, :content
end
