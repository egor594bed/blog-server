FactoryBot.define do  
  factory :comment do
    text { Faker::Lorem.paragraph }
    score { rand(0..5) }
    user_id { rand(1..100) }
    post_id { rand(1..100) }
  end
end
