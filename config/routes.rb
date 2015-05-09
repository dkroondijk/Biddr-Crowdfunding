Rails.application.routes.draw do

  root "auctions#index"
  
  resources :auctions do
    resources :bids, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
end
