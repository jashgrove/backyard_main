class ListingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show

  def index
    @listings = Listing.all
    @listing = Listing.new
    @current_user = current_user
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
    @bookings = @listing.bookings.where("start_date > ?", DateTime.now).where(approved: true)
    @listing_reviews = @listing.listing_reviews
    @review = ListingReview.new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @listing = Listing.create(listing_params)
    @listing.user = @user
    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_path(@listing) }
        format.json
      else
        format.html { render "listings/new", status: :unprocessable_entity }
        format.json
      end
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :address, :price_per_hour)
  end
end
