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


  resource :users, only: [:show, :edit, :update] do
    collection do
      get 'logout'
    end
  end
    

  resources :buyers, only: [:index]
  resource :users, only: [:show, :edit, :update]

  resources :items, only: [:index]
end
