class PaymentsController < ApplicationController

  def new
    @bid = Bid.find params[:bid_id]
  end

  def create
    @bid = Bid.find params[:bid_id]

    service = Bids::HandlePayment.new({
      bid: @bid,
      stripe_token: params[:stripe_token]
      })
    if service.call
      redirect_to auction_path(@bid.listings.auction),
      notice: 'Thanks for the payment'
    else
      render :new, alert: 'Something went wrong. Please try again'
    end

    redirect_to auction_path(@bid.auction), notice: 'Thanks for the payment. :)'
  end

end
