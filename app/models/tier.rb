class Tier < ApplicationRecord
  belongs_to :auction
  has_many :listings, dependent: :nullify

  validates :name, presence: true
  validates :opening_time, presence: true
  validates :closing_time, presence: true


end
