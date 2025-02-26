class BookingsController < ApplicationController
  before_action :set_listing, except: [:index]
  before_action :current_user

  def index
    @renter_bookings = current_user.bookings.includes(:listings)
    @owner_listings = current_user.listings.includes(:bookings)
  end

  def new
    @booking = @listing.bookings.new
  end

  def create
    @bookings = @listing.bookings
    @booking = @listing.bookings.new(booking_params)
    @booking.user = @user
    if @booking.save
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Booking could not be saved. Please check your input."
    end
  end

  def pending
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def current_user
    @user = User.first
  end
end
