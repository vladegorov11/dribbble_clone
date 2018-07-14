FactoryBot.define do
  factory :designer do
    name { Faker::Internet.username(7..14) }
    description Faker::Lorem.paragraph_by_chars(133)
    instagram_link 'password'
    facebook_link ''
    twitter_link ''
    city 'днепр'
    phone '+380994536482'
    user
  end
end


