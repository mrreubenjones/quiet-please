class AuctionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render new
    end
  end

  def show
    @auction = Auction.find params[:id]
  end

  def edit
  end

  def update
  end

  def destroy
    @auction = Auction.find params[:id]
    @auction.destroy
  end

private

  def auction_params
    params.require(:auction).permit(:name, :description)
  end

end
