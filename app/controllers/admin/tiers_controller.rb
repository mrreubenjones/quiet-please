class Admin::TiersController < ApplicationController
  before_action :authenticate_user

  def index
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
      render 'tier_form'
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
  end

  private

    def tier_params
      params.require(:tier).permit(:name, :description, :opening_time, :closing_time, :badge_color)
    end

end
