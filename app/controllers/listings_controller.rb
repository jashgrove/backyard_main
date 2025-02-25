class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def create
    @user = User.find(params[:id])
    @listing = Listing.new(listing_params)
    @listing.user = @user
    @listing.save
    redirect_to listing_path(@listing)
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description, :address, :price_per_hour)
  end
end
