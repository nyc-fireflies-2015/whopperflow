class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User"
  validates_presence_of :content
  def associated_question
    case self.commentable_type
    when "Answer"
      self.commentable.question
    when "Question"
      self.commentable
    end
  end
end
