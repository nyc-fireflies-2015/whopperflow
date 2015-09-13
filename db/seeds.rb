# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  FactoryGirl.create(:user)
end

10.times do
  # require 'pry';binding.pry
  q = Question.find_or_create_by(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, author: User.all.sample)
end

20.times do
  # binding.pry
  a = Question.all.sample.answers.find_or_create_by(content: Faker::Lorem.paragraph, author: User.all.sample)
end


