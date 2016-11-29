class User < ApplicationRecord
  has_secure_password
  has_many :auctions, dependent: :nullify
  has_many :bids, dependent: :nullify
  has_many :listings, dependent: :nullify
  has_many :favorites, dependent: :destroy
  has_many :messages, dependent: :nullify
  has_many :organizations, dependent: :nullify

  before_validation :downcase_email

  validates :email, presence: true,
                    uniqueness: true,
                    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i




  def full_name
    "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end

private

  def downcase_email
    self.email.downcase! if email.present?
  end




end
