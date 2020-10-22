FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username(specifier: 1..12) }
    email                 { Faker::Internet.free_email }
    password              { 'abcd1234' }
    password_confirmation { password }
  end
end
