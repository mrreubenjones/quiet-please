class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def create
    @auction = Auction.find params[:auction_id]
    @listing = Listing.new listing_params
    @listing.user = current_user
    @listing.auction = @auction
    @listing.images = params[:file]
    if @listing.save
      flash[:notice] = 'Listing saved.'
      redirect_to auction_path(@auction)
    else
      flash[:alert] = 'There was an issue with your listing. Please review the error message.'
      render new
    end
  end

  def show
    @listing = Listing.find params[:id]
  end

  def destroy
    @listing = Listing.find params[:id]
    @listing.destroy
  end

private

  def listing_params
    params.require(:listing).permit([
      :tier,
      :title,
      :description,
      :reserve_price,
      :guaranteed_price,
      {images: []}
      ])
  end

end