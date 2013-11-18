# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

Restaurant.delete_all
Menu.delete_all
User.delete_all

User.create!( name:     "First User",
              email:    "first@example.com",
              password: "FirstDollar")
User.create!( name:     "Second User",
              email:    "second@example.com",
              password: "FirstDollar")
User.create!( name:     "Admin User",
              email:    "admin@example.com",
              password: "FirstDollar",
              admin:    true)

CSV.foreach("seed_restaurants.csv", headers: true) do |row|
  Restaurant.create!(row.to_hash)
end

CSV.foreach("seed_menus.csv", { headers: true, encoding: "iso-8859-1:UTF-8" }) do |row|
  Menu.create!( name:           row['name'],
                description:    row['description'],
                price:          row['price'],
                category:       row['category'],
                restaurant_id:  Restaurant.find_by(name: row['restaurant']).id)
end

# name = "California Fish Grill"
# Restaurant.create!( name:         name,
#                     description:  "Seafood",
#                     address:      "3988 Barranca Pkwy",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "9496543838")
# id = Restaurant.find_by(name: name).id
# category = "FROM THE FRYER"
# Menu.create!( restaurant_id: id,
#               name:  "Shrimp Plate",
#               description:
#                 "Served with fries and coleslaw",
#               price: 7.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Fish Plate (Breaded Pollack)",
#               description:
#                 "Served with fries and coleslaw",
#               price: 7.49,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Scallop Plate",
#               description:
#                 "Served with fries and coleslaw",
#               price: 8.49,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Calamari Plate",
#               description:
#                 "Served with fries and coleslaw",
#               price: 7.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Fried Catfish",
#               description:
#                 "Served with fries and coleslaw",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Fish and Shrimp (Breaded Pollack)",
#               description:
#                 "Served with fries and coleslaw",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Fish and Scallop (Breaded Pollack)",
#               description:
#                 "Served with fries and coleslaw",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Shrimp and Scallop",
#               description:
#                 "Served with fries and coleslaw",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "Calamari and any other item from the fryer except Catfish",
#               description:
#                 "Served with fries and coleslaw",
#               price: 8.99,
#               category: category)
# category = "TACOS"
# Menu.create!( restaurant_id: id,
#               name:  "Fish Tacos (2) (Battered Pollock)",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)
# Menu.create!( restaurant_id: id,
#               name:  "",
#               description:
#                 "Two tacos, rice, and beans",
#               price: 8.99,
#               category: category)


# name = "Fukada"
# Restaurant.create!( name:         name,
#                     description:  "Japanese",
#                     address:      "8683 Irvine Center Dr",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "9493410111")
#                     # image:        open('https://s3.amazonaws.com/fliporder/restaurants/images/2/original/fukada.jpg') )
# id = Restaurant.find_by(name: name).id
# Menu.create!( restaurant_id: id,
#               name:  "Edamame",
#               description:
#                 "Boiled organic soybean",
#               price: 2.50,
#               category: "Appetizers")
# Menu.create!( restaurant_id: id,
#               name:  "Tofu",
#               description:
#                 "Cold organic tofu",
#               price: 3.00,
#               category: "Appetizers")

# name = "Mick's Karma Bar"
# Restaurant.create!( name:         name,
#                     description:  "Burgers",
#                     address:      "2010 Main St",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "9498516316",
#                     image:        open('https://s3.amazonaws.com/fliporder/restaurants/images/3/original/micks.jpg') )
# id = Restaurant.find_by(name: name).id
# Menu.create!( restaurant_id: id,
#               name:  "The Burger Combo",
#               description:
#                 "Build the burger combo. Select your burger, fries,
#                 and a drink.",
#               price: 9.25,
#               category: "Burgers")
# Menu.create!( restaurant_id: id,
#               name:  "The Karma Burger",
#               description:
#                 "100% Sirloin Steak Burger minced in-store,
#                 handmade patty to order, American cheese,
#                 with lettuce, roma tomato, Karma Sauce on our
#                 tasty bun No 19.",
#               price: 5.75,
#               category: "Burgers")
# Menu.create!( restaurant_id: id,
#               name:  "The Habanero Burger",
#               description:
#                 "Spicy! 4 chile escalivada, garlic mayo, lettuce
#                 and tomato topped with queso fresco on bun No 19.",
#               price: 6.25,
#               category: "Burgers")
# Menu.create!( restaurant_id: id,
#               name:  "The Baja",
#               description:
#                 "Guacamole and sour cream, pepperjack cheese,
#                 topped with pico de gallo and lettuce, bun No 19.",
#               price: 6.25,
#               category: "Burgers")
# Menu.create!( restaurant_id: id,
#               name:  "Karma Mediterranean Style",
#               description:
#                 "Lettuce and tomato, roasted peppers, basil, hummus
#                 topped with feta cheese on our tasty bun No 19.",
#               price: 6.25,
#               category: "Burgers")
# Menu.create!( restaurant_id: id,
#               name:  "Karma Swiss Onion Style",
#               description:
#                 "Caramelized onions, Gruyere Cheese, with lettuce,
#                 tomato mayo, ground mustard on Bun No 19.",
#               price: 6.50,
#               category: "Burgers")
# Menu.create!( restaurant_id: id,
#               name:  "The Roaring Forties",
#               description:
#                 "Blue cheese, portobello mushrooms, horseradish sauce
#                 with lettuce and tomato",
#               price: 6.75,
#               category: "Burgers")
# Menu.create!( restaurant_id: id,
#               name:  "The Chunky Fries",
#               description:
#                 "A large portion of our fries, served with
#                 your choice of sauce",
#               price: 3.50,
#               category: "Sides")
# Menu.create!( restaurant_id: id,
#               name:  "Hummus",
#               description:
#                 "Jalapeno and cilantro hummus served with
#                 fresh pita",
#               price: 5.95,
#               category: "Sides")
# Menu.create!( restaurant_id: id,
#               name:  "The Ultimate Fish Taco",
#               description:
#                 "Whole wild caught Mahi Mahi steak, grilled and served
#                 atop cabbage with baja sauce, topped with Mick's
#                 Pico de Gallo, fresh onions & cilantro",
#               price: 7.95,
#               category: "Entrees")
# Menu.create!( restaurant_id: id,
#               name:  "Meagans Greek Wrap",
#               description:
#                 "Fresh grilled chicken breast with romaine, tomato &
#                 jalapeno & cilantro hummus of the day, topped with red
#                 onions, feta & cilantro.
#                 Mrs. Micks Special Wrap, available also veggie",
#               price: 7.95,
#               category: "Entrees")
# Menu.create!( restaurant_id: id,
#               name:  "The Thai Wrap",
#               description:
#                 "Grilled chicken breast, brown rice, satay and
#                 chili sauce, spinach, beansprouts, and julliene carrots.",
#               price: 7.95,
#               category: "Entrees")
# Menu.create!( restaurant_id: id,
#               name:  "24oz Strawberry Basil Lemonade",
#               description:
#                 "Whole strawberries crushed with fresh basil
#                 topped with our homemade lemonade",
#               price: 3.25,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "24oz Mojito Iced Tea",
#               description:
#                 "Fresh lime juice mashed with fresh mint leaves and
#                 brown sugar, topped with our blood orange sencha
#                 green tea",
#               price: 3.25,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "24oz Purple Palmer",
#               description:
#                 "Pomegranate juice and hibiscus/cranberry iced tea
#                 topped with our fresh lemonade",
#               price: 3.25,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "24oz Fresh Lemonade",
#               description:
#                 "Our homemade fresh lemonade made in-store daily",
#               price: 2.95,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "24oz Classic Arnold Palmer",
#               description:
#                 "Choice of tea topped with our daily made fresh lemonade",
#               price: 2.95,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "500ml Mexi Coke",
#               description:
#                 "",
#               price: 2.95,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "24oz Iced Tea",
#               description:
#                 "Premium tropical iced tea or our blood orange sencha
#                 iced tea",
#               price: 2.50,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "Can of Diet Coke",
#               description:
#                 "",
#               price: 1.35,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "Can of Coke",
#               description:
#                 "",
#               price: 1.35,
#               category: "Drinks")
# Menu.create!( restaurant_id: id,
#               name:  "Can of 7 UP",
#               description:
#                 "",
#               price: 1.35,
#               category: "Drinks")

# name = "Kula Revolving Sushi Bar"
# Restaurant.create!( name:         name,
#                     description:  "Japanese Sushi Bar",
#                     address:      "2700 Alton Pkwy",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "9495530747",
#                     image:        open('https://s3.amazonaws.com/fliporder/restaurants/images/4/original/kula.jpg') )
# id = Restaurant.find_by(name: name).id
# Menu.create!( restaurant_id: id,
#               name:  "Salmon nigiri",
#               price: 2.00,
#               category: "Appetizers")
# Menu.create!( restaurant_id: id,
#               name:  "Tuna nigiri",
#               price: 2.00,
#               category: "Appetizers")

# name = "Le Diplomate Cafe"
# Restaurant.create!( name:         name,
#                     description:  "Sandwiches",
#                     address:      "4237 Campus Dr",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "9498545161",
#                     image:        open('https://s3.amazonaws.com/fliporder/restaurants/images/5/original/diplomate.gif') )
# id = Restaurant.find_by(name: name).id
# Menu.create!( restaurant_id: id,
#               name:  "Chicken Dijon",
#               description:
#                 "Chicken breast, dijon, garlic sauce & artichoke",
#               price: 2.99,
#               category: "Appetizers")

# name = "Tokyo Table"
# Restaurant.create!( name:         name,
#                     description:  "Sushi",
#                     address:      "2710 Alton Pkwy",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "9492630000")

# name = "Lazy Dog Restaurant & Bar"
# Restaurant.create!( name:         name,
#                     description:  "Classic American",
#                     address:      "13290 Jamboree Rd",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "7147319700")

# name = "Taco Rosa"
# Restaurant.create!( name:         name,
#                     description:  "Mexican Tacos",
#                     address:      "13792 Jamboree Rd",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "7145056080")

# name = "Pho Ba Co"
# Restaurant.create!( name:         name,
#                     description:  "Vietnamese noodles",
#                     address:      "4250 Barranca Pkwy Ste K",
#                     city:         "Irvine",
#                     state:        "CA",
#                     phone:        "9498578808")