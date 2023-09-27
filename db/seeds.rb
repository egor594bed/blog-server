# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@categories = []

100.times do 
  User.create(username: Faker::Internet.username)
end

10.times do 
  category = Faker::Lorem.word
  Category.create(key: category, name: Faker::Lorem.word, description: Faker::Lorem.word)
  @categories << category
end

100.times do 
  Post.create(title: Faker::Lorem.sentence, text: Faker::Lorem.paragraph, user_id: rand(1..100), category_key: @categories.sample)
end

1000.times do 
  Comment.create(post_id: rand(1..100), user_id: rand(1..100), text: Faker::Lorem.paragraph, score: rand(0..5))
end