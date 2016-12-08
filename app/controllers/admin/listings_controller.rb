class Admin::ListingsController < ApplicationController
  before_action :authenticate_user

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
      redirect_to admin_auction_path(@auction)
    else
      flash[:alert] = 'There was an issue with your listing. Please review the error message.'
      render :new
    end
  end

  def show
    find_listing
    @auction = @listing.auction
  end

  def edit
    find_listing
  end

  def update
    find_listing
    if @listing.update listing_params
      flash[:notice] = 'Listing updated'
      redirect_to admin_listing_path(@listing)
    else
      flash.now[:alert] = 'Please see errors below!'
      render :edit
    end
  end

  def destroy
    find_listing
    @listing.destroy
    redirect_to admin_auction_path(@listing.auction), notice: 'Listing deleted'
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

  def find_listing
    @listing = Listing.find params[:id]
  end

end