# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

User.destroy_all
Toothbrush.destroy_all

puts "seeding users.."
20.times do |user|
  data = Faker::Internet.user('username', 'email', 'password')
  user = User.new(
    username: data[:username],
    email: data[:email],
    password: data[:password],
  )
  user.save!
end

puts "seeding toothbrushes.."
20.times do
  toothbrush = Toothbrush.new(
    title: Faker::Creature::Animal.name,
    description: Faker::Quote.matz,
    color: Faker::Color.color_name,
    category: Faker::Creature::Dog.breed
  )
  toothbrush.announcer = User.first
  toothbrush.save!
  puts "toothbrush created!"
end
