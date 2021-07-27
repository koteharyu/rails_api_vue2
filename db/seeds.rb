# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "seed", email: "seed@example.com", password: "password", password_confirmation: "password")
user = User.find_by(name: "seed")
21.times do |i|
  user.microposts.create!(content: "hello #{i}")
end
