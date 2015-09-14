# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do
  u = FactoryGirl.create(:user)
  u2 = FactoryGirl.create(:user)
  2.times do
    q = u.questions.create(FactoryGirl.attributes_for(:question))
    2.times do
      c = q.comments.create(FactoryGirl.attributes_for(:comment).merge(author: u2))
      2.times do
        c.comments.create(FactoryGirl.attributes_for(:comment).merge(author: u)) 
      end
    end
    3.times do
      a = q.answers.create(FactoryGirl.attributes_for(:answer).merge(author: u2))
      2.times do
        c = a.comments.create(FactoryGirl.attributes_for(:comment).merge(author: u))
        2.times do
          c.comments.create(FactoryGirl.attributes_for(:comment).merge(author: u2)) 
        end
      end
    end
  end
end