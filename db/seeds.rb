require "faker"
require "open-uri"
require "json"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
montreal_addresses = [
  "1234 Saint-Denis Street, Montreal, QC",
  "5678 Sherbrooke Street East, Montreal, QC",
  "9102 Saint-Laurent Boulevard, Montreal, QC",
  "3456 Rue de la Montagne, Montreal, QC",
  "7890 Saint-Catherine Street West, Montreal, QC",
  "2345 Avenue du Parc, Montreal, QC",
  "6789 Rue Peel, Montreal, QC",
  "4567 Rue Saint-Antoine West, Montreal, QC",
  "8901 Avenue des Pins, Montreal, QC",
  "1012 Boulevard René-Lévesque West, Montreal, QC"
]

backyard_names = [
    "Montreal Garden Retreat",
    "Urban Oasis Montreal",
    "The Cozy Courtyard",
    "Backyard Bliss in Montreal",
    "The Verdant Haven",
    "Montreal Skyline Hideaway",
    "The City Sanctuary",
    "La Cour Montreal",
    "The Green Escape",
    "Le Jardin Secret",
    "Montreal Suntrap",
    "The Peaceful Patio",
    "Serenity in the City",
    "The Urban Zen Garden",
    "Montreal Breezes Retreat",
    "Le Petit Jardin",
    "The Backyard Haven",
    "Montreal Hidden Garden"
  ]

backyard_descriptions = [
    "A peaceful garden oasis nestled in the heart of Montreal, perfect for morning coffee or evening relaxation.",
    "A lush urban retreat with vibrant greenery and cozy seating, ideal for unwinding after a day of exploring the city.",
    "Your own private outdoor sanctuary, offering serene vibes, soft lighting, and a welcoming atmosphere.",
    "A charming backyard featuring a mix of plants, flowers, and comfy spaces, inviting you to relax and enjoy the fresh Montreal air.",
    "An enchanting space filled with fragrant flowers and leafy trees, perfect for an afternoon nap or evening drinks.",
    "A tranquil garden escape with a mix of natural beauty and modern comfort, ideal for enjoying the Montreal skyline.",
    "A secluded green hideaway where you can enjoy quiet moments, surrounded by nature and a peaceful atmosphere.",
    "A bright and airy patio garden with the perfect balance of greenery and sunlight, ideal for meals or enjoying a book.",
    "A cozy backyard retreat with plenty of seating, perfect for dining al fresco or simply relaxing in a lush environment.",
    "A vibrant garden with colorful flowers and comfortable seating, offering a serene escape from the bustling city.",
    "A peaceful hideaway with soft lighting and lush greenery, offering the perfect setting for outdoor meals and gatherings.",
    "A charming Montreal backyard that blends nature with comfort, providing a restful place to unwind in privacy.",
    "A relaxing outdoor space filled with trees and plants, offering a serene escape with a cozy atmosphere for any time of day.",
    "An inviting garden space designed for relaxation, featuring lush plants, comfortable seating, and a calm ambiance.",
    "A peaceful urban retreat surrounded by greenery, perfect for enjoying Montreal warm summer evenings."
  ]

  reviews_listings = [
    "Cozy backyard with lots of greenery and soft lighting. Feels like a hidden escape from the city.",
    "Spacious patio with modern furniture and a fire pit. Great for evening gatherings.",
    "Small but charming, surrounded by flowers and a vine-covered fence. Perfect for a quiet coffee.",
    "Riverside backyard with a peaceful view. Gets breezy in the evenings, bring a sweater.",
    "A backyard designed for BBQ lovers, with a built-in grill and plenty of seating.",
    "Rustic setting with a mix of stone and wood, ideal for relaxed summer nights.",
    "Tucked away behind an old brick house, this backyard feels like a secret garden.",
    "Minimalist space with a simple deck and hanging lights. Best for casual get-togethers.",
    "A backyard with a small pond and plenty of trees. A little slice of nature in the city.",
    "Lush grass, comfortable hammocks, and a cozy fire pit make this backyard a great retreat."
  ]

  cloudinary_urls = [
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740689601/pexels-julia-m-cameron-8841157_nbksxw.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740689601/pexels-daliladalprat-1843647_slz7dg.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740689600/pexels-marianne-67058-238377_maw0fx.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740689600/pexels-jason-boyd-1388339-3209049_ufcxfn.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740689600/pexels-marianne-67058-238385_m1dygk.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740689599/pexels-blankspace-2615407_pvua6t.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740759402/pexels-toan-d-cong-680842095-30921879_njuxyb.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740760421/pexels-harry-cooke-6195012_oogbyb.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740760541/pexels-athena-2972890_xiyjwy.jpg",
    "https://res.cloudinary.com/ducax2ucs/image/upload/v1740760540/pexels-pixabay-261410_ejdux4.jpg"
  ]


ListingReview.destroy_all
Booking.destroy_all
Listing.destroy_all
User.destroy_all

#  for login
users = 10.times.map do |i|
  User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: montreal_addresses[i % montreal_addresses.length]
  )
end

cloudinary_urls.shuffle!
backyard_names.shuffle!
backyard_descriptions.shuffle!

10.times do |i|
  user = users[i]

  listing = Listing.create!(
    name: backyard_names[i],
    description: backyard_descriptions[i % backyard_descriptions.length],
    address: montreal_addresses[i % montreal_addresses.length],
    price_per_hour: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    user: user
  )

  url = cloudinary_urls[i % cloudinary_urls.length]
  file = URI.parse(url).open
  listing.photo.attach(io: file, filename: "image_#{i}.jpg", content_type: "image/jpeg")

  3.times do |j|
    reviewer = users.sample
    next if reviewer == user

    ListingReview.create!(
      content: reviews_listings.sample,
      rating: Faker::Number.between(from: 1, to: 5),
      user: reviewer,
      listing: listing
    )
  end
end
