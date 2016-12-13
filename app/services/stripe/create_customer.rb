module Stripe
  class CreateCustomer

    include Virtus.model

    # input
    attribute :stripe_token, String
    attribute :description, String

    # output
    attribute :customer

    def call
      begin
        attempt_create_customer
      rescue Stripe::InvalidRequestError => e
        false
      rescue => e
        Rails.logger.info e.class
        false
      end
    end

    private

    def attempt_create_customer
      @customer ||= Stripe::Customer.create(
        description: "Customer for bid ##{bid.user_id}",
        source: stripe_token # obtained with Stripe.js
      )
      true
    end

  end
end