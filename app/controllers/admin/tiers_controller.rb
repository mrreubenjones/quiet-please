class Admin::TiersController < ApplicationController
  before_action :authenticate_user

  def index
    @auction = Auction.find params[:auction_id]
    @tiers = @auction.tiers.all
    @listings = @auction.listings.where(tier_id: nil).order(title: :asc)
  end

  def new
  end

  def create
    @auction = Auction.find params[:auction_id]
    @tier = Tier.new tier_params
    @tier.auction = @auction
    if @tier.save
      redirect_to admin_auction_path(@auction)
    else
      render 'auctions/show'
    end
  end

  def show
    @tier = Tier.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
    @tier = Tier.find params[:id]
    @tier.destroy
    redirect_to admin_auction_path(@tier.auction), notice: 'Tier deleted'
  end

  private

    def tier_params
      params.require(:tier).permit(:name, :description, :opening_time, :closing_time, :badge_color)
    end

end
