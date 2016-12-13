module Bids
  class HandlePayment

    include Virtus.model

    attribute :stripe_token, String
    attribute :bid, Bid

    def call
      create_customer && update_user && charge_customer && update_bid
    end

    private

    def update_user
      # RJ: Need to update the user record with Stripe customer ID
      true
    end

    def create_customer
      service = Stripe::CreateCustomer.new(
        stripe_token: stripe_token,
        description: description
        )
      if service.call
        @customer = service.customer
      else
        outcome
      end
    end

    def update_bid
      # RJ: Need to update bid with Stripe transaction ID
      true
    end

    def charge_customer
      # RJ: Refactor this into service object to handle exceptions that
      # arise from connecting with Stripe
      charge = Stripe::Charge.create(
        amount: (@bid.amount * 100).to_i,
        currency: 'cad',
        customer: customer.id,
        description: "Bid with ID ##{@bid.id}"
      )
      true
    end

  end
end