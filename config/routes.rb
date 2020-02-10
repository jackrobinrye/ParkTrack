Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    resources :parks, only: [:index, :show] do
      resources :sightings, only: [:index, :new]
    end 

    resources :sightings

    resources :species, only: [:index, :show]

    resources :users, only: [:show, :new, :create]

    resources :sessions, only: [:new, :create, :destroy]

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
