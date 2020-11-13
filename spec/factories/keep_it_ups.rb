FactoryBot.define do
  factory :keep_it_up do
    association :user
    association :tweet
  end
end
