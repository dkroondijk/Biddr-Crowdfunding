class Auction < ActiveRecord::Base
  belongs_to :user
  has_many :bids

  validates :title, presence: true
  validates :details, presence: true
  validates :reserve_price, numericality: {greater_than_or_equal_to: 1}
end
