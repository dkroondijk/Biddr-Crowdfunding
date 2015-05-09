class User < ActiveRecord::Base
  has_secure_password

  has_many :auctions
  has_many :bids

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: :true
end
