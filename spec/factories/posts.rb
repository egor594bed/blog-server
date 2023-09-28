FactoryBot.define do  
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    user_id { rand(1..100) }
    category_key { Faker::Lorem.word }
  end
end
