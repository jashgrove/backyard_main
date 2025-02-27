require "faker"
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

ListingReview.destroy_all
Booking.destroy_all
Listing.destroy_all
User.destroy_all

#  for login
user = User.create(
    email: "user@gmail.com",
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: montreal_addresses.sample,
  )

5.times do

  user = User.create(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: montreal_addresses.sample,
  )

  listing = Listing.create(
    name: backyard_names.sample,
    description: backyard_descriptions.sample,
    address: montreal_addresses.sample,
    price_per_hour: Faker::Number.decimal(l_digits: 2),
    user: user,
  )
  3.times do
    ListingReview.create(
      content: Faker::Lorem.paragraph,
      rating: Faker::Number.between(from: 1, to: 5),
      user: user,
      listing: listing,
    )
  end
end
