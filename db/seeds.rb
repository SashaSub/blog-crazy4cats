# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
    Post.create(title: Faker::Lorem.sentence,
                #photo: "https://picsum.photos/200/300",
                photo: Faker::LoremFlickr.image(size: "50x60", search_terms: ['cats']),              
                description: Faker::Lorem.paragraph,
                when_went: Faker::Date.between(from: 3.years.ago, to: Date.today),                
                user_id: Faker::Number.between(from: 1, to: 5)                
                )
end
    