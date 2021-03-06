class Admin::AuctionsController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def new
  end

  def create
    @user = User.find(session[:user_id])
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to admin_auction_path(@auction)
    else
      render 'users/dashboard'
    end
  end

  def show
    @auction = Auction.find params[:id]
    @tier = Tier.new
    @tiers = @auction.tiers.order(:name)
    @listing = Listing.new
    @listings = @auction.listings.order(:title)
  end

  def edit
    @auction = Auction.find params[:id]
  end

  def update
    @auction = Auction.find params[:id]
    if @auction.update auction_params
      flash[:notice] = 'Auction updated'
      redirect_to admin_auction_path(@auction)
    else
      flash.now[:alert] = 'Please see errors below!'
      render :edit
    end
  end

  def destroy
    @auction = Auction.find params[:id]
    @auction.destroy
    redirect_to dashboard_path, notice: 'Auction deleted'
  end

private

  def auction_params
    params.require(:auction).permit(:name, :description)
  end

end
