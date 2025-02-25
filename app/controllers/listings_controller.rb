class ListingsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :show

  def show
    @listing = Listing.find(params[:id])
    @listing_reviews = @listing.listing_reviews
  end

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
