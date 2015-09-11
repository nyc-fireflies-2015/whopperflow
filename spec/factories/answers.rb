FactoryGirl.define do
	factory :answer do
		content { Faker::Lorem.paragraph }
	end
	association :question, factory: :question
	association :authory, factory: :user
end

