class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :auction
  has_many :bids, dependent: :nullify
  has_many :favorites, dependent: :destroy

  validates :title,
    presence: true,
    uniqueness: true
  validates :description, presence: true
  validates :reserve_price, presence: true

  attr_accessor :remove_image

  mount_uploaders :images, ImageUploader


  def max_amount
    bids.max.amount
  end

end
