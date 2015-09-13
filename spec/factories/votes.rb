FactoryGirl.define do
  factory :vote do
    up { [true, false].sample }
  end
end

