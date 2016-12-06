class TiersController < ApplicationController

  def index
  end

  def new
  end

  def create
    @auction = Auction.find params[:auction_id]
    @tier = Tier.new tier_params
    if @tier.save
      redirect_to auction_path(@auction)
    else
      render 'tier_form'
    end
  end

  def show
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
