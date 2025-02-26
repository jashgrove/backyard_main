class BookingsController < ApplicationController
  before_action :set_listing, except: [:index]
  before_action :current_user, except: [:create]

  def index
    @renter_bookings = current_user.bookings.includes(:listings)
    @owner_listings = current_user.listings.includes(:bookings)
  end

  def new
    @booking = @listing.bookings.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user
    @booking.approved = true

    respond_to do |format|
      if @booking.save
        format.html { redirect_to listing_path(@listing) }
        format.json # Follows the classic Rails flow and look for a create.json
      else
        format.html { render listing_path(@listing), status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json
      end
    end
  end

private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def current_user
    @user = current_user
  end
end
