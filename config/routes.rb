Rails.application.routes.draw do

  get 'sightings/show'
  get 'sightings/new'
  get 'sightings/edit'
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  
  
  get 'species/index'
  get 'species/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :parks, only: [:index, :show] do
      resources :sightings, only: [:index, :new]
    end 

    resources :sightings

    resources :species, only: [:index, :show]

    get '/dashboard', to: 'users#show' 

    # resources :users, only: [:show]

    # resources :sessions, only: [:new, :create, :destroy]

    root 'application#hello'

    #show/update/destroy
    # sighting/1

    #edit
    # sighting/1/edit

    #new -- this is where new parks or new species would be created
    # parks/1/sightings/new
    # sightings/new

    #index
    # sightings/
    # parks/1/sightings

    # species/

    # parks/

    #git add .
    #git commit -m "message"
    #git push



end
