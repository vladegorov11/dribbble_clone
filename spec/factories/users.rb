FactoryBot.define do
  factory :user do
    name { Faker::Internet.username(7..14) }
    password 'password'
    password_confirmation 'password'
    sequence(:email) { |n| "email-#{n}@some.domain" }
  end
end