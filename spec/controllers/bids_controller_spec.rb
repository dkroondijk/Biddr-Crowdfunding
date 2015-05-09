require 'rails_helper'

RSpec.describe BidsController, type: :controller do
  before { login(user) }

  let(:user)     { create(:user)     }
  let(:auction) { create(:auction) }
  let(:bid)   { create(:bid, user: user, auction: auction)   }
  let(:bid_1) { create(:bid, auction: auction) }


  describe "#create" do
    context "with valid params" do
      def valid_request
        post :create, auction_id: auction.id, 
                      bid: attributes_for(:bid)
      end

      it "increases the number of bids in the database" do
        expect { valid_request }.to change { Bid.count }.by(1)
      end

      it "associates bid with auction whose id it is passed" do
        valid_request
        expect(Bid.last.auction).to eq(auction)
      end

      it "redirects to the auction show page" do
        valid_request
        expect(response).to redirect_to auction_path(auction)
      end

      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to be
      end
    end

    context "with invalid params" do
      def invalid_request
        post :create, auction_id: auction.id, bid: {bid_price: 0}
      end

      it "doesnt increase the number of bids in the database" do
        expect { invalid_request }.not_to change { Bid.count }
      end

      it "renders the auction show page" do
        invalid_request
        expect(response).to render_template("auctions/show")
      end

      it "sets a flash message" do
        invalid_request
        expect(flash[:alert]).to be
      end
    end
  end

  describe "#destroy" do

    def valid_request
      delete :destroy, id: bid.id, auction_id: auction.id
    end

    it "reduces the number of bids in the database by 1" do
      bid
      expect { valid_request }.to change { Bid.count }.by(-1)
    end

    it "redirects to the auction show page" do
      valid_request
      expect(response).to redirect_to auction_path(auction)
    end

    it "sets a flash message" do
      valid_request
      expect(flash[:notice]).to be
    end
  end

end
