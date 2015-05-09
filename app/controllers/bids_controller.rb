class BidsController < ApplicationController
  before_action :authenticate_user!

  def create
    @auction = Auction.find(params[:auction_id])
    @bid = Bid.new(bid_params)
    @bid.user = current_user
    @bid.auction = @auction
    @bids = @auction.bids

    if @bids != []
      if @bid.bid_price > @bids.last.bid_price
        if @bid.save
          redirect_to auction_path(@auction), notice: "Bid Placed"
        else
          render "auctions/show"
          flash[:alert] = "Could not place bid!"
        end
      else
        render "auctions/show"
        flash[:alert] = "Could not place bid!"
      end
    else
      if @bid.save
        redirect_to auction_path(@auction), notice: "Bid Placed"
      else
        render "auctions/show"
        flash[:alert] = "Could not place bid!"
      end
    end

  end

  def destroy
    @auction = Auction.find(params[:auction_id])
    @bid = current_user.bids.find(params[:id])
    @bid.destroy
    redirect_to @auction, notice: "Bid Deleted"
  end


  private

  def bid_params
    params.require(:bid).permit(:bid_price)
  end
end
