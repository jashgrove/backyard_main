class ListingController < ApplicationController
  def index
    @listings = Listing.all
    @listing = Listing.new
  end

  def new
    @listing = Listing.new
  end

  def create
    @user = User.find(params[:id])
    @listing = Listing.create(listing_params)
    @listing.user = @user
    @listing.save

  def show
    @listing = Listing.find(params[:id])
  def new
    @listing = Listing.new
  end

  def create
    @user = User.find(params[:id])
    @listing = Listing.create(listing_params)
    @listing.user = @user
    @listing.save
  end

  private

  def listing_params
  params.require(:listing).permit(:name :description :address :price_per_hour)
  end
end
