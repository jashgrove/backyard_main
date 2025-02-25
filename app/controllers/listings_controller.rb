<<<<<<< HEAD:app/controllers/listing_controller.rb
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
=======
class ListingsController < ApplicationController
>>>>>>> 3ceebe987836f9df1991ae23db2c02642c7bd689:app/controllers/listings_controller.rb

  def show
    @listing = Listing.find(params[:id])
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

  private

  def listing_params
  params.require(:listing).permit(:name :description :address :price_per_hour)
  end
end
