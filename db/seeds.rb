# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: 'abc', email: 'abc@mail.com', password: '123456', password_confirmation: '123456')
collection = user.collections.create!(name: 'First Collection')
collection.websites.create!(url: 'https://www.owler.com')

Website.all.each do |site|
  20.times do |n|
    rank = 1_614_533 - n
    date = Time.zone.at(0.0 + rand * (Time.now.to_f - 0.0.to_f))
    site.alexaranks.create!(rank: rank, created_at: date)
  end
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
