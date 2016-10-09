Rails.application.routes.draw do
  resources :spaces
  resources :amenities
  resources :likes
  resources :images
  resources :areas
  resources :countries
  resources :space_types
  resources :vibes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
