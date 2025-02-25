class ListingReviewsController < ApplicationController

  def create
    @listing = Listing.find(params[:listing_id])
    @review = ListingReview.new(listing_review_params)
    @review.listing = @listing
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to listing_path(@listing) }
        format.json # Follows the classic Rails flow and look for a create.json
      else
        format.html { render listing_path(@listing), status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json
      end
    end
  end

  private

  def listing_review_params
    params.require(:listing_review).permit(:content, :rating)
  end
end
