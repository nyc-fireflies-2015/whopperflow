FactoryGirl.define do 
	factory :answer_comment, class: 'Comment' do
		content { Faker::Lorem.paragraph }	
		association :commentable, factory: :answer
	end
	factory :question_comment, class: 'Comment' do
		content { Faker::Lorem.paragraph }	
		association :commentable, factory: :question
	end
end
