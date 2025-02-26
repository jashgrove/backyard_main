class BookingsController < ApplicationController
  before_action :set_listing, except: %i[index pending approve deny]
  before_action :authenticate_user!

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
    @booking.user = current_user
    if @booking.save
      redirect_to listing_path(@listing)
    else
      flash[:alert] = "Booking could not be saved. Please check your input."
#     respond_to do |format|
#       if @booking.save
#         format.html { redirect_to listing_path(@listing) }
#         format.json # Follows the classic Rails flow and look for a create.json
#       else
#         format.html { render listing_path(@listing), status: :unprocessable_entity }
#         format.json # Follows the classic Rails flow and look for a create.json
#       end
    end
  end

  def pending
    @bookings = current_user.bookings.where(status: "pending")
  end

  def approve
    @bookings = Booking.find(params[:id])
    if (@bookings.status = 'approved')
      flash[:alert] = "Booking succesfully denied"
    end
  end

  def deny
    @bookings = Booking.find(params[:id])
    if (@bookings.status = 'denied')
      flash[:alert] = "Booking succesfully denied"
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
