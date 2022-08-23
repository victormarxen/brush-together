# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

20.times do |user|
  data = Faker::Internet.user('username', 'email', 'password')
  user = User.new(
    username: data[:username],
    email: data[:email],
    password: data[:password],
  )
  user.save!
end
