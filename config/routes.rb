Rails.application.routes.draw do
  root "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :exhibition, only: :new
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resource :users, only: [:show, :edit, :update]
 
  resources :items, only: [:index]


end