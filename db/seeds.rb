# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
 u = FactoryGirl.create(:user)
 5.times do
    q = u.questions.create(FactoryGirl.attributes_for(:question))
    5.times do
      q.answers.create(FactoryGirl.attributes_for(:answer))
    end
  end
end
