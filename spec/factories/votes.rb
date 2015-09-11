FactoryGirl.define do
  factory :vote do
    up_or_down { [true, false].sample }
  end
end

