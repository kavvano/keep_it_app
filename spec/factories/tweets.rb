FactoryBot.define do
  factory :tweet do
    text        { Faker::Lorem.sentence }
    association :user

    after(:build) do |tweet|
      tweet.image.attach(io: File.open('app/assets/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
