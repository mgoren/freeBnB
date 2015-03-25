class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      flash[:notice] = "Listing created."
      redirect_to listing_path(@listing)
    else
      flash[:error] = "Listing created."
      redirect_to :new
    end
  end

private
  def listing_params
    params.require(:listing).permit(:title, :description, :location)
  end
end
