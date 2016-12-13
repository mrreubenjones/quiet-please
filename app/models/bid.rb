class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  validates :amount, presence: true

end
