class Listing < ApplicationRecord
  belongs_to :user
  has_one_attached :photo


  validates :name, presence: true
  validates :address, presence: true, uniqueness: true
  validates :price_per_hour, presence: true, numericality: { greater_than: 0 }
  validates :user, presence: true
  has_many :bookings
  has_many :listing_reviews

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
