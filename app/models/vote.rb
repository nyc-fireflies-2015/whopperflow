class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  belongs_to :author, class_name: "User", foreign_key: :user_id
end
