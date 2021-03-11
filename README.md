# ParkTrack

This app is designed for a person who visits national parks to be able to track the species they see there. 


## Architecture and models

The main 3 models in this project are Sightings, Parks, and Species. The Sightings table functions as a join table between Parks, Species, and Users. 


## Development

Devise and Omniauth were used to create this project. 

## Pulling up the application

To open this application: 
    1) Run `rails db:migrate` in your console
    2) Run `rails db:seed` in your console
    3) Run `rails s` in your console
    4) Open http://localhost:3000/ in your browser of choice