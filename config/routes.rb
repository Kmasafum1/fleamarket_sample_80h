Rails.application.routes.draw do
  root "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :categories, only: [:index]

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

  resources :items do
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
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
