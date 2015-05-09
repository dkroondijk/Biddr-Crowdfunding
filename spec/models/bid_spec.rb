require 'rails_helper'

RSpec.describe Bid, type: :model do
  describe "validations" do
    # it "only allows bids greater than the current price" do

    #   auction = Auction.new(title: "My Soul", 
    #                 details: "Has little value", 
    #                 ends_on: (Time.now + 30.days), 
    #                 reserve_price: 500, 
    #                 current_price: 10)
    #   auction.save

    #   bid = Bid.new(bid_price: 5)
    #   bid.auction = auction
    #   bid.save
    #   expect(bid).to be_invalid
    # end
  end
end
