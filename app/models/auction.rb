class Auction < ApplicationRecord
  belongs_to :user
  has_many :listings, dependent: :destroy
  has_many :tiers, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  after_initialize :set_defaults

  # Manage states with Acts As State Machine: https://github.com/aasm/aasm
  include AASM

  aasm :whiny_transitions => false do
    state :drafted, :initial => true
    state :running
    state :completed
    state :cancelled

    event :run do
      transitions :from => :drafted, :to => :running
    end

    event :complete do
      transitions :from => :running, :to => :completed
    end

    event :cancel do
      transitions :from => [:drafted, :completed], :to => :cancelled
    end
  end

  # Friendlier URLs
  def to_param
      "#{id}-#{name.parameterize}"
  end


private

def set_defaults
  self.raised ||= 0
end

end
