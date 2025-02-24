class Listing < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :price_per_hour, presence: true, numericality: { greater_than: 0 }
  validates :user, presence: true
  has_many :bookings
  has_many :listing_reviews
end
