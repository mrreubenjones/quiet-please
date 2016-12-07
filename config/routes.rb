Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#home'

  # Auctions state custom routes
  post '/auctions/:auction_id/publish', to: 'transitions#create_publish', as: 'publish'
  post '/auctions/:auction_id/cancel', to: 'transitions#create_cancel', as: 'cancel'
  post '/auctions/:auction_id/met', to: 'transitions#create_met', as: 'met'
  post '/auctions/:auction_id/not-met', to: 'transitions#create_not_met', as: 'not_met'
  post '/auctions/:auction_id/win', to: 'transitions#create_win', as: 'win'
  post '/auctions/:auction_id/draft', to: 'transitions#create_draft', as: 'draft'

  resources :users, only: [:index, :new, :create, :show], shallow: true do
    resources :settings, only: [:index]
    resources :bids, only: :index
  end
  get '/dashboard', to: 'users#dashboard', as: 'dashboard'

  resources :auctions, shallow: true do
    resources :tiers
    resources :listings do
      resources :bids
    end
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end



end



