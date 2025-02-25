class BookingsController < ApplicationController
  before_action :set_listing

  def listing_bookings
    @bookings = @listing.bookings
  end

  def new
    @booking = @listing.bookings.new
  end

  def create
    @bookings = @listing.bookings
    user = User.create!(email: "test@example.com", password: "password123")
    @booking = @listing.bookings.new(booking_params)
    @booking.user = user
    if @booking.save
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Booking could not be saved. Please check your input."
    end
  end

private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
