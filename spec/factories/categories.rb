FactoryBot.define do  
  factory :category do
    key { Faker::Lorem.word }
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
  end
end
