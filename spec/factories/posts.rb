FactoryBot.define do  
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    user_id { rand(1..100) }
    category_key { Faker::Lorem.word }
    comments_counter { rand(0..5) }
  end
end
