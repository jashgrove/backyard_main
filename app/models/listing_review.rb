class ListingReview < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :rating, presence: true
end
