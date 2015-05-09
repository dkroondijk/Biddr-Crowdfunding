class Auction < ActiveRecord::Base
  include AASM

  belongs_to :user
  has_many :bids

  validates :title, presence: true
  validates :details, presence: true
  validates :reserve_price, numericality: {greater_than_or_equal_to: 1}

  aasm do
    state :published, initial: true
    state :reserve_met
    state :won
    state :cancelled
    state :reserve_not_met

    event :reserve do
      transitions from: :published, to: :reserve_met
    end

    event :win do
      transitions from: :published, to: :won
    end

    event :cancel do
      transitions from: :published, to: :cancelled
    end
  end
end
