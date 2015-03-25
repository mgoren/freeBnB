class ListingsController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]

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
      flash[:notice] = "Listing added!"
      redirect_to listing_path(@listing)
    else
      flash[:error] = "Listing not created. ):"
      redirect_to new_listing_path
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    unless @listing.user == current_user
      flash[:error] = "Unable to update another user's listing!"
      redirect_to listing_path(@listing)
    else
      if @listing.update(listing_params)
        flash[:notice] = "Listing updated."
        redirect_to listing_path(@listing)
      else
        flash[:error] = "Listing not updated. ):"
        redirect_to edit_listing_path(@listing)
      end
    end
  end

private
  def listing_params
    params.require(:listing).permit(:title, :description, :location, :photo)
  end
end
