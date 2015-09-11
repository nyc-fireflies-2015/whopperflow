FactoryGirl.define do
  factory :answer do
<<<<<<< 2fd36a3767f00bf81bb2603411812cf9dcc2e3d0
    content { Faker::Lorem.paragraph }
  end
  association :question, factory: :question
  association :author, factory: :user
end

=======
    
  end

end
>>>>>>> Create models and migrations
