class ListingController < ApplicationController

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
end
