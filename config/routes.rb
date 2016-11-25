Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#new'

  resources :users, only: [:index, :new, :create, :show]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end



end
