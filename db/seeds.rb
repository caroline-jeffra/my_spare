# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning database..."
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

puts "Introducing music to humankind (creating users)"
# The default user password is "password". For different passwords use: Faker::Internet.password

# The following are normal users:

7.times do
  User.create(email: Faker::Internet.email, encrypted_password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: Faker::Address.city)
end

# The following are instrument owners:
user1 = User.create(email: Faker::Internet.email, encrypted_password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: Faker::Address.city)
user2 = User.create(email: Faker::Internet.email, encrypted_password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: Faker::Address.city)
user3 = User.create(email: Faker::Internet.email, encrypted_password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: Faker::Address.city)
user4 = User.create(email: Faker::Internet.email, encrypted_password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: Faker::Address.city)
user5 = User.create(email: Faker::Internet.email, encrypted_password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: Faker::Address.city)

puts "Users created!"

puts "Pythagoras had the first dream of what will be known as the monochord (creating instruments)"

# User-1's instruments:
2.times do
  Instrument.create(model: Faker::Music.genre, brand: Faker::Ancient.god, category: Faker::Music.instrument, daily_price: Faker::Number.decimal, description: Faker::Quotes::Shakespeare.hamlet_quote, image_url: "https://images.pexels.com/photos/270288/pexels-photo-270288.jpeg?auto=compress&cs=tinysrgb&w=800", user_id: user1.id)
end

# User-2's instruments:
3.times do
  Instrument.create(model: Faker::Music.genre, brand: Faker::Ancient.god, category: Faker::Music.instrument, daily_price: Faker::Number.decimal, description: Faker::Quotes::Shakespeare.hamlet_quote, image_url: "https://images.pexels.com/photos/45243/saxophone-music-gold-gloss-45243.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", user_id: user2.id)
end

# User-3's instruments:
4.times do
  Instrument.create(model: Faker::Music.genre, brand: Faker::Ancient.god, category: Faker::Music.instrument, daily_price: Faker::Number.decimal, description: Faker::Quotes::Shakespeare.hamlet_quote, image_url: "https://images.pexels.com/photos/1246437/pexels-photo-1246437.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2," user_id: user3.id)
end

# User-4's instruments:
5.times do
  Instrument.create(model: Faker::Music.genre, brand: Faker::Ancient.god, category: Faker::Music.instrument, daily_price: Faker::Number.decimal, description: Faker::Quotes::Shakespeare.hamlet_quote, image_url: "https://images.pexels.com/photos/33597/guitar-classical-guitar-acoustic-guitar-electric-guitar.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2", user_id: user4.id)
end

# User-5's instruments:
6.times do
  Instrument.create(model: Faker::Music.genre, brand: Faker::Ancient.god, category: Faker::Music.instrument, daily_price: Faker::Number.decimal, description: Faker::Quotes::Shakespeare.hamlet_quote, image_url: "https://images.pexels.com/photos/306088/pexels-photo-306088.jpeg?auto=compress&cs=tinysrgb&w=800", user_id: user5.id)
end

puts "Instruments created and tuned!"
puts "All set!"
