class BidsController < ApplicationController

  def create
    @listing = Listing.find params[:listing_id]
    @bids = @listing.bids
    @bid = Bid.new bid_params
    @bid.user = current_user
    @bid.listing = @listing

    if @bid.amount > high_bid
      submit_bid
    else
      render 'listings/show', alert: 'Please bid higher'
    end
  end

private

  def bid_params
    params.require(:bid).permit(:amount)
  end

  def high_bid
    @bids.last.present? ? max_bid = @bids.last.amount : max_bid = 0
  end

  def submit_bid
    if @bid.save
      # RJ: Add set_listing_state when ready
      redirect_to listing_path(@listing)
    else
      render 'listings/show'
    end
  end

  def set_listing_state
    # if @bid.amount > @auction.reserve_price
    #   if @auction.published? || @listing.reserve_not_met?
    #     @auction.update_attributes(aasm_state: 'reserve_met')
    #   elsif @auction.max_amount && @auction.date_ending > Time.current
    #     @auction.update_attributes(aasm_state: 'won')
    #   end
    # end
  end

end
