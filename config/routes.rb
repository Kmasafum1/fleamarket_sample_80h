Rails.application.routes.draw do

  root "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
 
  resources :items, only: [:index] 
   
  
  resources :categories, only: [:index] do
    # collection do
    #   get 'search_child'
    #   get 'search_grandchild'
    #   # get 'search_child', defaults: { format: 'json' }
    #   # get 'search_grandchild', defaults: { format: 'json' }
    # end
  end  
end

