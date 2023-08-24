# Sets Pexels client
client = Pexels::Client.new

puts "Cleaning database..."
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

CITIES = ["Amsterdan", "Den Haag", "Utrecht", "Leiden", "Rotterdam"]

puts "Introducing music to humankind (creating users)"
# The default user password is "password". For different passwords use: Faker::Internet.password

# Admin user here, do not delete from seed
puts "making admin user"
User.new(
  email: "admin@email.com",
  password: "password",
  first_name: "Admin",
  last_name: "Admin",
  city: CITIES.sample
).save

# The following are normal users:
7.times do |i|
  User.new(
    email: "user#{i}@email.com",
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: CITIES.sample
  ).save
end

puts "Pythagoras had the first dream of what will be known as the monochord (creating instruments and their owners)"

5.times do |i|
  User.new(
    email: "owner#{i}@email.com",
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: CITIES.sample
  ).save!
  2.times do
    random_instrument = Faker::Music.instrument
    Instrument.new(
      model: Faker::Music.genre,
      brand: Faker::Ancient.god,
      category: random_instrument,
      city: CITIES.sample,
      daily_price: rand(0..200),
      description: Faker::Quotes::Shakespeare.hamlet_quote,
      image_url: client.photos.search(random_instrument).to_a.sample.src["medium"],
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
