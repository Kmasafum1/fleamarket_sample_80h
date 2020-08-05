Rails.application.routes.draw do
  root 'items#index'
  # root 'home#top'
  devise_for :users

end
