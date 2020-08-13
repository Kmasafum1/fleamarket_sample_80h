Rails.application.routes.draw do
  root "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
 
  resources :items, only: [:index] 
   
  
  resources :categories, only: [:index] 
    # collection do
    #   get 'search_child'
    #   get 'search_grandchild'
    #   # get 'search_child', defaults: { format: 'json' }
    #   # get 'search_grandchild', defaults: { format: 'json' }
    # end
  # end  
end

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

  
end
