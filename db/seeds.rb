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

# The following are normal users

7.times do
  User.create(email: xxx, encrypted_password: "password", first_name: xxx, last_name: xxx, city: xxx)
end

# The following are instrument owners
user1 = User.create(email: xxx, encrypted_password: "password", first_name: xxx, last_name: xxx, city: xxx)

Faker::Book.title

puts "Users created"

puts "Creating instruments"

instrument1 = Instrument.create(model: xxx, brand: xxx, category: xxx, daily_price: xxx, description: xxx, image_url: xxx, user_id: user1.id)


puts "Instruments created and tuned!"

# If need, the code below can be used to seed Bookings

puts "Booking some instruments"

Booking.create(start_date: xxx, end_date: xxx, cost: xxx, instrument_id: instrument1.id, user_id: user1.id)


puts "Part of the available instruments were booked!"
