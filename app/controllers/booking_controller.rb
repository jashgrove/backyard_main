class BookingController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @user = Current.user
    @listing = Listing.find(params[:id])
    @booking = Booking.create(listing_params)
    @booking.user = @user
    @booking.listing = @listing
    @booking.save
  end
end
