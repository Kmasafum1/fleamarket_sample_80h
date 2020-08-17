Rails.application.routes.draw do
  root "items#index"

  resources :exhibition, only: :new

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  resource :users, only: [:show, :edit, :update]
  resources :items, only: [:index, :new] do
    resources :buyers, only: [:index] do
      collection do
        post 'pay', to: 'buyers#pay'
      end
    end  
  end
  
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end
