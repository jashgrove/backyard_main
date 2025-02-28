class ListingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show

  def index
    @listings = Listing.all
    @listing = Listing.new
    @current_user = current_user

    # The `geocoded` scope filters only listings with coordinates
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {listing: listing}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def my_index
    @listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def show
    unless params[:id] =~ /^\d+$/
      redirect_to root_path, alert: "Invalid listing ID"
      return
    end

    @listing = Listing.find(params[:id])
    @bookings = @listing.bookings.where("start_date > ?", DateTime.now).where(status: "approved")
    @listing_reviews = @listing.listing_reviews
    if current_user && current_user != @listing.user && @listing.bookings.find { |booking| booking.user_id == current_user.id && booking.start_date < DateTime.now }
      @review = ListingReview.new unless @listing_reviews.find { |review| review.user_id == current_user.id }
    end
    @booking = Booking.new

    # The `geocoded` scope filters only listings with coordinates
    if @listing.latitude.present? && @listing.longitude.present?
      @markers = [{
        lat: @listing.latitude,
        lng: @listing.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { listing: @listing }),
        marker_html: render_to_string(partial: "marker")
      }]
    else
      @markers = []
    end
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

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path, status: :see_other
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :address, :price_per_hour, :photo)
  end
end
