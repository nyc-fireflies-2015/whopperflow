FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }


		# factory :invalid_question do
    	# title nil
    	# content { Faker::Lorem.paragraph }
  	# end
  end
end

