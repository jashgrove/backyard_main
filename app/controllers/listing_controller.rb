class ListingController < ApplicationController

  def new
    @listing = Listing.new
  end

  def create
    @user = User.find(params[:id])
    @listing = Listing.create(listing_params)
    @listing.user = @user
    @listing.save
  end
end
