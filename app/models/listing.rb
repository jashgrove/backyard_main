class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, :listing_reviews
end
