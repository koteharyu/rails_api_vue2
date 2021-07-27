# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do |i|
  fname = Gimei::hiragana
  femail = Faker::Internet.unique.email
  pass = "password"
  User.create!(
    name: fname,
    email: femail,
    password: pass,
    password_confirmation: pass
  )
end
