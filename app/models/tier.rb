class Tier < ApplicationRecord
  belongs_to :auction
  has_many :listings, dependent: :nullify
end
