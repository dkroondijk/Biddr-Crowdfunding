require 'rails_helper'

RSpec.describe Auction, type: :model do
  
  def valid_attributes(new_attributes)
    attributes = {title: "My Soul", 
                  details: "Has little value", 
                  ends_on: (Time.now + 30.days), 
                  reserve_price: 500, 
                  current_price: 10}
    attributes.merge(new_attributes)
  end

  describe "validations" do
    it "requires a title" do
      a = Auction.new(valid_attributes(title: nil))
      expect(a).to be_invalid
    end

    it "requires details" do
      a = Auction.new(valid_attributes(details: nil))
      expect(a).to be_invalid
    end

    it "requires a numerical reserve price" do
      a = Auction.new(valid_attributes(reserve_price: "fsdsf"))
      expect(a).to be_invalid
    end

    it "requires the reserve price to be greater than $1" do
      a = Auction.new(valid_attributes(reserve_price: 0))
      expect(a).to be_invalid
    end
  end
end
