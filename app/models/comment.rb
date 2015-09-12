class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User", foreign_key: "id"
  def associated_question
    case self.commentable_type
    when "Answer"
      self.answer.question
    when "Question"
      self.question
    end
  end
end
