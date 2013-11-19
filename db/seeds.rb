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