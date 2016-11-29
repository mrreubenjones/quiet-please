class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  has_many :bids, dependent: :nullify
  has_many :favorites, dependent: :destroy

end
