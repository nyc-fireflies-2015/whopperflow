class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "id"
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers
  has_one :best_answer, class_name: "Answer"
  validates_presence_of :title, :content
end
