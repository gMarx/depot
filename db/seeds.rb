# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# delete any items that may have been entered
Product.delete_all

# create tent
Product.create!(title: 'Sierra Designs Sirius 2',
  description: 'lightweight Tent',
  image_url: 'tent.jpg',
  price: 117.95)

# create Merica
Product.create!(title: 'Pride in your Country',
  description: 'I salute you',
  image_url: 'Merica.jpg',
  price: 1776)

# create Amalia
Product.create!(title: 'Mi Amor, mi Prometida',
  description:
    %{<p>
        What's there to say?
        I love this woman!
    </p>},
  image_url: 'Amalia_sack.jpg',
  price: 0)
