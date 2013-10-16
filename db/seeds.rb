# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all
Restaurant.create!( restaurant_name:  "California Fish Grill",
              description:      "Seafood",
              image_url:        "cfg.jpg")
Restaurant.create!( restaurant_name:  "Fukada",
              description:      "Japanese",
              image_url:        "fukada.jpg")
Restaurant.create!( restaurant_name:  "Mick's Karma Bar",
              description:      "Burgers",
              image_url:        "micks.jpg")
Restaurant.create!( restaurant_name:  "Kula Revolving Sushi Bar",
              description:      "Japanese Sushi Bar",
              image_url:        "kula.jpg")
Restaurant.create!( restaurant_name:  "Le Diplomate Cafe",
              description:      "Sandwiches",
              image_url:        "diplomate.gif")