# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

# On veut des données en Français.
Faker::Config.locale = 'fr'

puts "Suppression des anciens restaurants et avis..."
Review.destroy_all
Restaurant.destroy_all

puts "Création de nouveaux restaurants..."

CATEGORIES = %w[chinese italian japanese french belgian]

nombre_de_restaurants = 7
nombre_d_avis_par_restaurant = 3

nombre_de_restaurants.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  puts "Restaurant créé : #{restaurant.name} - #{restaurant.category}"

  # Création de 3 avis pour chaque restaurant
  nombre_d_avis_par_restaurant.times do
    review = Review.create!(
      content: Faker::Restaurant.review,
      rating: rand(0..5),
      restaurant: restaurant
    )
    puts "  ➜ Avis ajouté : Note #{review.rating} - #{review.content}"
  end
end

puts "#{nombre_de_restaurants} restaurants et #{nombre_de_restaurants * nombre_d_avis_par_restaurant} avis créés avec succès !"
