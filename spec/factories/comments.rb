<<<<<<< 2fd36a3767f00bf81bb2603411812cf9dcc2e3d0
FactoryGirl.define do 
  factory :answer_comment, class: 'Comment' do
    content { Faker::Lorem.paragraph }	
    association :commentable, factory: :answer
  end
  factory :question_comment, class: 'Comment' do
    content { Faker::Lorem.paragraph }	
    association :commentable, factory: :question
  end
=======
FactoryGirl.define do
  factory :comment do
    
  end

>>>>>>> Create models and migrations
end
