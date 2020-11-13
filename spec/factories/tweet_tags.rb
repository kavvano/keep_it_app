FactoryBot.define do
  factory :tweet_tag do
    association :tweet
    association :tag
  end
end
