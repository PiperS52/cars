# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
colour_attributes = [
  { name: 'red' },
  { name: 'blue' },
  { name: 'white' },
  { name: 'black' }
]

colour_attributes.each do |attributes|
  Colour.where(attributes).first_or_create
end

car_attributes = [
  { make: "Citroen", model: "C5", build_date: DateTime.new(2020, 5, 22), colour_id: 1 },
  { make: "Volkswagen", model: "Golf", build_date: DateTime.new(2020, 3, 20), colour_id: 2 },
  { make: "Nissan", model: "Qashqai", build_date: DateTime.new(2021, 1, 02), colour_id: 3 },
  { make: "Vauxhall", model: "Corsa", build_date: DateTime.new(2019, 8, 14), colour_id: 4 }
]

car_attributes.each do |attributes|
  Car.where(attributes).first_or_create
end 