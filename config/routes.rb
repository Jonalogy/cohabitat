Rails.application.routes.draw do
  resources :shouts
  resources :bookings
  resources :availabilities
  root 'main#index'
  get 'search' => 'main#show'

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "areaofcountry" => "areas#area_of_country"

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
