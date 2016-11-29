class Organization < ApplicationRecord
  belongs_to :user
  has_many :auctions, dependent: :nullify
end
