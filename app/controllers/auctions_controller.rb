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
    @auction = Auction.find params[:id]
  end

  def update
    @auction = Auction.find params[:id]
    if @auction.update auction_params
      flash[:notice] = 'Auction updated'
      redirect_to @auction
    else
      flash.now[:alert] = 'Please see errors below!'
      render :edit
    end
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
