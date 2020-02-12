# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create_table "parks", force: :cascade do |t|
#     t.string "name"
#     t.integer "size"
#     t.string "location"
#   end

grand_teton = Park.create(name: "Grand Teton", size: 485, location: "Wyoming")
yellowstone = Park.create(name: "Yellowstone", size: 3471, location: "Wyoming")
yosemite = Park.create(name: "Yosemite", size: 1169, location: "California")


#   create_table "species", force: :cascade do |t|
#     t.string "name"
#     t.string "kingdom"
#   end

#wyoming
bobcat = Species.create(name: "Bobcat", kingdom: "Animalia")

#california
red_fox = Species.create(name: "Red Fox", kingdom: "Animalia")

#all
black_bear = Species.create(name: "Black Bear", kingdom: "Animalia")
pine = Species.create(name: "Pine Tree", kingdom: "Plantae")



#   create_table "users", force: :cascade do |t|
#     t.string "email"
#     t.string "password"
#     t.string "name"
#     t.integer "age"
#   end

# jack = User.create(email: "jack@gmail.com", password: "password", name: "Jack", age: 25)
# sarah = User.create(email: "sarah@gmail.com", password: "password", name: "Sarah", age: 24)


#   create_table "sightings", force: :cascade do |t|
#     t.datetime "date"
#     t.integer "user_id"
#     t.integer "park_id"
#     t.integer "species_id"
#   end

Sighting.create(date: Date.new(2015, 12, 8), user_id: 1, park_id: grand_teton.id, species_id: bobcat.id)
Sighting.create(date: Date.new(2015, 12, 10), user_id: 1, park_id: yellowstone.id, species_id: bobcat.id)
Sighting.create(date: Date.new(2016, 12, 10), user_id: 1, park_id: yellowstone.id, species_id: black_bear.id)
Sighting.create(date: Date.new(2017, 12, 10), user_id: 1, park_id: yellowstone.id, species_id: pine.id)
Sighting.create(date: Date.new(2015, 10, 12), user_id: 2, park_id: yosemite.id, species_id: black_bear.id)
Sighting.create(date: Date.new(2015, 10, 12), user_id: 2, park_id: yosemite.id, species_id: pine.id)
Sighting.create(date: Date.new(2015, 10, 12), user_id: 2, park_id: yosemite.id, species_id: red_fox.id)