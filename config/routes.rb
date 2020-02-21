Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :parks, only: [:index, :show] do
      resources :sightings, only: [:index, :new]
    end 

    resources :sightings

    resources :species, only: [:index, :show]

    get '/dashboard', to: 'users#show' 

    root 'application#hello'




end
