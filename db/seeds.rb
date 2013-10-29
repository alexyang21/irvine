# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all
Restaurant.create!( name:         "California Fish Grill",
                    description:  "Seafood",
                    image_url:    "cfg.jpg",
                    address:      "3988 Barranca Pkwy",
                    city:         "Irvine",
                    state:        "CA",
                    phone:        "9496543838")
Restaurant.create!( name:         "Fukada",
                    description:  "Japanese",
                    image_url:    "fukada.jpg",
                    address:      "8683 Irvine Center Dr",
                    city:         "Irvine",
                    state:        "CA",
                    phone:        "9493410111")
Restaurant.create!( name:         "Mick's Karma Bar",
                    description:  "Burgers",
                    image_url:    "micks.jpg",
                    address:      "2010 Main St",
                    city:         "Irvine",
                    state:        "CA",
                    phone:        "9498516316")
Restaurant.create!( name:         "Kula Revolving Sushi Bar",
                    description:  "Japanese Sushi Bar",
                    image_url:    "kula.jpg",
                    address:      "2700 Alton Pkwy",
                    city:         "Irvine",
                    state:        "CA",
                    phone:        "9495530747")
Restaurant.create!( name:         "Le Diplomate Cafe",
                    description:  "Sandwiches",
                    image_url:    "diplomate.gif",
                    address:      "4237 Campus Dr",
                    city:         "Irvine",
                    state:        "CA",
                    phone:        "9498545161")

Menu.delete_all
Menu.create!( restaurant_id: 1,
              name:  "Cajun Salmon",
              description:
                "Mixed greens, sprouts, green onions, feta cheese,
                dried cranberries, red onion, cherry tomatoes,
                walnuts, sweet & tangy lime vinaigrette",
              price: 9.99)
Menu.create!( restaurant_id: 1,
              name:  "Cajun Seared Ahi",
              description:
                "Mixed greens, sprouts, green onions, cotija cheese,
                cherry tomatoes, red onions, cilantro, pumpkin seeds,
                & cilantro dressing",
              price: 9.99)
Menu.create!( restaurant_id: 1,
              name:  "Asian Shrimp",
              description:
                "Mixed greens, sprouts, cilantro, sesame seeds,
                cherry tomatoes, almonds, fried wontons, red onions,
                green onions, & asian dressing",
              price: 9.99)
Menu.create!( restaurant_id: 2,
              name:  "Edamame",
              description:
                "Boiled organic soybean",
              price: 2.50)
Menu.create!( restaurant_id: 2,
              name:  "Tofu",
              description:
                "Cold organic tofu",
              price: 3.00)
Menu.create!( restaurant_id: 3,
              name:  "Asian Shrimp",
              description:
                "Mixed greens, sprouts, cilantro, sesame seeds,
                cherry tomatoes, almonds, fried wontons, red onions,
                green onions, & asian dressing",
              price: 8.49)
Menu.create!( restaurant_id: 3,
              name:  "The Karma Burger",
              description:
                "100% Sirloin Steak Burger minced in-store,
                handmade patty to order, American cheese,
                with lettuce, roma tomato, Karma Sauce on our
                tasty bun No 19.",
              price: 5.75)
Menu.create!( restaurant_id: 3,
              name:  "The Habanero Burger",
              description:
                "Spicy! 4 chile escalivada, garlic mayo, lettuce
                and tomato topped with queso fresco on bun No 19.",
              price: 6.25)
Menu.create!( restaurant_id: 3,
              name:  "The Baja",
              description:
                "Guacamole and sour cream, pepperjack cheese,
                topped with pico de gallo and lettuce, bun No 19.",
              price: 6.25)
Menu.create!( restaurant_id: 3,
              name:  "Karma Mediterranean Style",
              description:
                "Lettuce and tomato, roasted peppers, basil, hummus
                topped with feta cheese on our tasty bun No 19.",
              price: 6.25)
Menu.create!( restaurant_id: 3,
              name:  "Karma Swiss Onion Style",
              description:
                "Caramelized onions, Gruyere Cheese, with lettuce,
                tomato mayo, ground mustard on Bun No 19.",
              price: 6.50)
Menu.create!( restaurant_id: 4,
              name:  "Salmon nigiri",
              price: 2.00)
Menu.create!( restaurant_id: 4,
              name:  "Tuna nigiri",
              price: 2.00)
Menu.create!( restaurant_id: 5,
              name:  "Chicken Dijon",
              description:
                "Chicken breast, dijon, garlic sauce & artichoke",
              price: 2.99)

User.delete_all
User.create!( name:     "First User",
              email:    "first@example.com",
              password: "Thanksgiving")
User.create!( name:     "Second User",
              email:    "second@example.com",
              password: "Thanksgiving")
