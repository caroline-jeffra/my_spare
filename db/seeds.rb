# Sets Pexels client
client = Pexels::Client.new

puts "Cleaning database..."
Booking.destroy_all
Instrument.destroy_all
User.destroy_all

CITIES = ["Amsterdan", "Den Haag", "Utrecht", "Leiden", "Rotterdam"]
INSTRUMENTS = [
  {
    model: "Cory Wong Stratocaster",
    brand: "Fender",
    category: "Electric Guitar",
    daily_price: 60,
    description: <<~DESCRIPTION,
    Recognized for his incredible funk chops and inventive lead work, guitarist, producer, and arranger Cory Wong's soulful playing with Vulfpeck, as well as his Grammy-nominated solo work have earned him a loyal following and led to sold-out arena performances. The Cory Wong Stratocaster® is a tribute to Cory's favorite Fender®, thoughtfully modified to meet the funk master's needs. With limited quantities available in each color, this exclusive guitar is sure to set you apart from the crowd.

      The satin lacquer finish recreates the look and feel of Cory's beloved original Strat®, while the scaled-down alder body - slightly smaller than a typical Stratocaster - combined with American Ultra™ Modern "D" neck and sculpted body contours deliver a sublimely comfortable playing experience. A set of Seymour Duncan® Cory Wong Clean Machine™ pickups provides classic Strat quack and chime, fine-tuned to achieve his distinctive tone.

        Other features include a maple neck with subtly modified headstock shape, rosewood fingerboard with rolled edges and a compound 10-14" radius, vintage-style 6-screw synchronized Tremolo, deluxe locking tuners that provide improved tuning stability and easy string changes, and a push/push pot on Tone 2 that bypasses the 5-way switch and defaults to "Position 4". Also included are a Cory Wong hair tie (for muting the tremolo springs to achieve Cory's rhythm tone), rubber straplock washer set and custom neck plate.
        DESCRIPTION
      image_url: "https://www.fmicassets.com/Damroot/ZoomJpg/10009/0115010704_fen_ins_frt_1_rr.jpg"
  },
  {
    model: "Builder's Edition 814ce",
    brand: "Taylor",
    category: "Acoustic Guitar",
    daily_price: 40,
    description: <<~DESCRIPTION,
    6-String | Adirondack Spruce Top | Indian Rosewood Back and Sides | Neo-Tropical Mahogany Neck | West African Crelicam Ebony Fretboard | Expression System® 2 Electronics | Beveled Cutaway | Taylor Deluxe Hardshell Brown Case
    Solid Indian rosewood for warm response and lush overtones
    Adirondack spruce top for unmatched volume and power
    Beveled armrest and cutaway for enhanced playability
    All-gloss finish with Kona edgeburst for back/sides
    Includes ES2 electronics and deluxe hardshell case
    DESCRIPTION
      image_url: "https://www.taylorguitars.com/sites/default/files/styles/guitar_desktop/public/images/2023-04/taylor-be-814ce-1208232194-frontleft-2022.png"
  },
  {
    model: "AMERICAN PROFESSIONAL II JAZZ BASS",
    brand: "Fender",
    category: "Bass",
    daily_price: 45,
    description: "https://www.fmicassets.com/Damroot/ZoomJpg/10001/0193972700_fen_ins_frt_1_rr.jpg",
    image_url: "https://www.fmicassets.com/Damroot/ZoomJpg/10001/0193972700_fen_ins_frt_1_rr.jpg"
  },
  {
    model: "MODEL D",
    brand: "Steinway",
    category: "Grand Piano",
    daily_price: 150,
    description: <<~DESCRIPTION,
    At 8' 11¾" (274 cm) in length, this majestic musical instrument — the pinnacle of concert grand pianos — is the overwhelming choice of the world's greatest pianists and for anyone who demands the highest level of musical expression.

      5 solid spruce braces with a volume of 2,907 cu. in. Spruce provides tensile strength with less weight. Maple dowels fasten braces to rim producing a single homogenous foundation upon which is built the entire tonal component. A cast iron treble bell, affixed to rim's underside at treble bend, holds plate firmly in position by means of a steel bolt. The Steinway & Sons iron wedge anchors brace ends securely to crossblock assuring permanent rim posture.

      European spruce keys, individually weighed-off. Chip-proof, stain-resistant coverings for naturals; slip-proof, abraded ebonized sharps. Durable Linden wood buttons reinforce keys over balance rail, permitting maximum tonal power with every strike. Longest key: 24½" (62.2 cm).
      DESCRIPTION
      image_url: "https://www.steinway.com/.imaging/mte/steinway-us-theme/XL-Square/dam/pianos/Steinway_Grands/model-d/Art_Gallery_Model_D_Visualizer_square3.jpg/jcr:content/Art_Gallery_Model_D_Visualizer_r1_square.jpg"
  },
  {
    model: "DGX-670",
    brand: "Yamaha",
    category: "Electric Piano",
    daily_price: 35,
    description: <<~DESCRIPTION,
    The DGX-670 is a digital piano for enjoying everything from straight-ahead piano playing to playing along with other instruments. In addition to the high quality of the piano, the advanced Automatic Accompaniment Styles provide backing in a wide range of musical genres including pop, R&B, and jazz. Display sheet music to aid practice, connect to smartphones, microphones, and other equipment, and discover the many other ways to enjoy music with this feature-packed instrument.

      Only Yamaha can offer the elite quality of the DGX-670 piano Voices. From tonal variation that responds to the player’s touch to the sympathetic resonance of grand pianos, the impressive sound represents an authentic piano-playing experience only an acoustic piano manufacturer can deliver.

      The DGX-670 offers a wide range of Voices in addition to the piano, from 630 realistic-sounding instruments including electric pianos, organs, and strings, to catchy synthesized sounds.

      The advanced Automatic Accompaniment Styles make it possible to jam with any number of other “musicians,” from a combo to a big band. There are 263 accompaniment Styles including rock, R&B, and dance. Enjoy an experience that feels just like playing a live session in a band.
      DESCRIPTION
      image_url: "https://europe.yamaha.com/en/files/Image-index_DGX-670_1080x1080_2c0a210fc97a750cab947e7870aa0e77.jpg?impolicy=resize&imwid=1080&imhei=1080"
  },
  {
    model: "Hofner Violin H225 Series",
    brand: "Höfner",
    category: "Violin",
    daily_price: 90,
    description: <<~DESCRIPTION,
    Handmade in Germany

    These Hofner master instruments are copied from fine historical instruments. They are made from exquisite tone wood and are exclusively handcrafted by skilled luthiers, giving each instrument its own character.
      Wood
    Top: Alpine Spruce
    Back,sides,neck: European Maple
    Fingerboard, nuts: Ebony
    Wood quality: AAA
    DESCRIPTION
      image_url: "https://www.hofner.com/web/image/product.image/2905/image_1024/Paesold%20Violin%20PA807%20Series%20%28copy%29-1?unique=70fdc3e"
  },
  {
    model: "Fiddlerman Apprentice Cello Outfit",
    brand: "Fiddlerman",
    category: "Cello",
    daily_price: 25,
    description: <<~DESCRIPTION,
    Solid-carved slightly flamed spruce and maple tonewoods
    100% ebony fingerboard, pegs & fittings
    Carbon tailpiece with 4 fine tuners
    Quality hand-carved maple bridge
    European spruce soundpost from "Alpine Tone Wood"
    Spirit-based durable dark brown finish
    Wood dried a minimum of 5 years
    Installed D'Addario Prelude Strings
    Great for Suzuki and NAfME (National Association for Music Education) students
    Precisely measured string height for easy and comfortable playability
    DESCRIPTION
      image_url: "https://fiddlershop.com/cdn/shop/products/Fiddlerman-Apprentice-Cello-Main_1x_b45edb05-103d-4013-a307-71d4c8f51814_1300x.jpg?v=1586444113"
  },
  {
    model: "YAS-875EX",
    brand: "Yamaha" ,
    category: "Saxophone",
    daily_price: 20,
    description:<<~DESCRIPTION,
    The new Yamaha YAS-875EX Custom EX alto saxophone marks a huge step forward for saxophone design. Offering players a wealth of new musical possibilities, the new Custom EX has been designed in collaboration with some of the world’s most talented saxophonists, including Nobuya Sugawa, Jean-Yves Fourmeau and Otis Murphy. Their invaluable input has meant that Yamaha have been able to create an instrument that sounds great, is comfortable to play, and that constantly evolves with the player.
    DESCRIPTION
    image_url: "https://europe.yamaha.com/en/files/yas-875ex_02_1200x480_cef173c58f13cbf4a2e3327496189eb5.jpg"
  },
  {
    model: "REFERENCE ONE",
    brand: "Pearl",
    category: "Drums",
    daily_price: 50,
    description: <<~DESCRIPTION,
    Delivering the best features of Pearl's original Reference and Reference Pure Series drums, Reference One is an uncompromised, total percussion instrument where every element combines to create a drum sound you've never experienced.
      Each reduced-thickness EvenPly shell in the Reference One set is fitted with MasterCast Die-Cast hoops for a radical combination of sustain and attack. Included with Reference One, Pearl’s R2 Air Tom Suspension System delivers perfectly balanced, weightless tom mounting for high-yield tonal clarity.
      The Reference One shell and hardware Recipe elevate the professional drum set experience with shells that are tuned to draw the best tones from of each drum. 8" and 10" shells are EvenPly-6 (5.4mm) Maple/Birch for more attack and higher pitch. The 12" tom (the "Middle-C" in the Reference tom spectrum) is all Maple for the tonal center. 13," and larger toms add Mahogany inner plies to lower pitch and add tonal depth. Floor Toms and Bass Drums are an 8-ply Mahogany/Maple fusion to maximize bass frequencies.
      DESCRIPTION
      image_url: "https://bdbo2.thomann.de/thumb/bdb3000/pics/bdbo/18273644.jpg"
  },
  {
    model: "YFL-472 H",
    brand: "Yamaha",
    category: "Flute",
    daily_price: 40,
    description: <<~DESCRIPTION,
    Ring keys
    Pointed arms
    Offset G
    E Mechanism
    Head and body made of sterling silver
    Mechanism: German silver
    Silver-plated
    CY head piece with poly-conical curve for excellent response and rich sound
    The flutes of the 400 series are manufactured individually and adjusted by hand
    Full, pithy tone
    Accurate intonation
    Comfortable to play
    Includes case and accessories
    DESCRIPTION
    image_url: "https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_43/433091/12910058_800.jpg"
  }
]


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

INSTRUMENTS.each_with_index do |instrument, i|
  User.new(
    email: "owner#{i}@email.com",
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: CITIES.sample
  ).save!
  Instrument.new(
    model: instrument[:model],
    brand: instrument[:brand],
    category: instrument[:category],
    city: CITIES.sample,
    daily_price: instrument[:daily_price],
    description: instrument[:description],
    image_url: instrument[:image_url],
    user_id: User.last.id
  ).save!
end
# 5.times do |i|
#   User.new(
#     email: "owner#{i}@email.com",
#     password: "password",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     city: CITIES.sample
#   ).save!
#   2.times do
#     random_instrument = Faker::Music.instrument
#     Instrument.new(
#       model: Faker::Music.genre,
#       brand: Faker::Ancient.god,
#       category: random_instrument,
#       city: CITIES.sample,
#       daily_price: rand(0..200),
#       description: Faker::Quotes::Shakespeare.hamlet_quote,
#       image_url: client.photos.search(random_instrument).to_a.sample.src["medium"],
#       user_id: User.last.id
#     ).save!
#   end
# end

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
