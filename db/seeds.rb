puts "Cleaning database..."
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

puts "Introducing music to humankind (creating users)"
# The default user password is "password". For different passwords use: Faker::Internet.password

# Admin user here, do not delete from seed
puts "making admin user"
User.new(
  email: "admin@email.com",
  password: "password",
  first_name: "Admin",
  last_name: "Admin",
  city: "Adminville"
).save

# The following are normal users:
7.times do
  User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: Faker::Address.city
  ).save
end

puts "Pythagoras had the first dream of what will be known as the monochord (creating instruments and their owners)"

5.times do
  User.new(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: "Amsterdam"
  ).save!
  2.times do
    Instrument.new(
      model: Faker::Music.genre,
      brand: Faker::Ancient.god,
      category: "Guitar",
      city: "Den Haag",
      daily_price: rand(0..200),
      description: Faker::Quotes::Shakespeare.hamlet_quote,
      image_url: "https://images.pexels.com/photos/45243/saxophone-music-gold-gloss-45243.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      user_id: User.last.id
    ).save!
  end
end

puts "Instruments created and tuned!"
puts "All set!"

puts "Generating bookings"
20.times do
  user = User.order("RANDOM()").limit(1).first
  instrument = Instrument.order("RANDOM()").limit(1).first
  start_date = Date.today + rand(0..14)
  end_date = start_date + rand(0..4)
  booking = Booking.new(start_date: start_date, end_date: end_date, user: user, instrument: instrument)
  booking.save! if booking.valid?
end
puts "Bookings created!"
