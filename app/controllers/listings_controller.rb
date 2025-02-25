class ListingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
    @listing_reviews = @listing.listing_reviews
  end

  def create
    @user = User.find(params[:id])
    @listing = Listing.create(listing_params)
    @listing.user = @user
    @listing.save
    redirect_to  listing_path
  end

private

  def listing_params
    params.require(:listing).permit(:name :description :address :price_per_hour)
  end

end
