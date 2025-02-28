class Booking < ApplicationRecord
  belongs_to :listing
  belongs_to :user

  validates :start_date, presence: true, uniqueness: { scope: :start_date, message: "Date already booked " }
  validates :end_date, presence: true, uniqueness: { scope: :end_date, message: "Date already booked " }
  validate :no_overlapped_bookings

  private

  def no_overlapped_bookings
    @listing = Listing.new
    @bookings = @listing.bookings
    @bookings.each do |b|
      overlapped_bookings = Booking.where('start_date < ? AND end_date > ?', b.start_date, b.start_date).exists?
      overlapped_bookings_two = Booking.where('start_date > ? AND start_date < ?', b.start_date, b.end_date).exists?
      if overlapped_bookings.exists? || overlapped_bookings_two.exists?
        flash[:alert] = "There was an error creating your booking."
      end
    end
  end
end
