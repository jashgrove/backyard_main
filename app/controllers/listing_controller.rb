class ListingController < ApplicationController

  def index
    @lists = List.all
  end
end
