class ListingController < ApplicationController

<<<<<<< HEAD
def new
  @listing = Listing.find(params[:id])
end

def create
  @listing = Listing.create(listing_params)
  @listing.save
  redirect_to  listing_path
end

private

def listing_params
  params.require(:listing).permit(:name :description :address :price_per_hour)
end
=======

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
>>>>>>> master
end
