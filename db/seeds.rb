# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'
require 'faker'

url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
data = JSON.parse(url)
data['drinks'].each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
end

Cocktail.create!(name: 'Mojito')
Cocktail.create!(name: 'Angelo Azzurro')
Cocktail.create!(name: 'Gin Tonic')

8.times do
  Dose.create!(description: Faker::Food.measurement, cocktail: Cocktail.all.sample, ingredient: Ingredient.all.sample)
end
