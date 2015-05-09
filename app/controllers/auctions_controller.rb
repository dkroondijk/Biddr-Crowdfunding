class AuctionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @auctions = Auction.all
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction), notice: "Auction Created"
    else
      render :new
      flash[:alert] = "Can't Create Auction"
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bid = Bid.new
    @bids = @auction.bids

    if @bids != []
      @auction.current_price = @bids.last.bid_price
    end
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    if @auction.update(auction_params)
      redirect_to auction_path(@auction), notice: "Auction Updated!"
    else
      render :edit
      flash[:alert] = "Can't Update Auction"
    end
  end

  def destroy
    auction = Auction.find(params[:id])
    auction.destroy
    redirect_to auctions_path, notice: "Auction Deleted"
  end


  private

  def auction_params
    params.require(:auction).permit(:title, 
                                    :details, 
                                    :ends_on, 
                                    :reserve_price, 
                                    :current_price)
  end
end
