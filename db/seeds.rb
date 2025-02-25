require "faker"
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Listing.destroy_all

5.times do

  user = User.create(
    email: Faker::Internet.email,
    password: "password",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
  )

  Listing.create(
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    address: Faker::Address.full_address,
    price_per_hour: Faker::Number.decimal(l_digits: 2),
    user: user,
  )
end
