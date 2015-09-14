class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true, counter_cache: true
  belongs_to :voter, class_name: "User"
  validates_presence_of :voter
end
