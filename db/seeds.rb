# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
puts "Cleaning database..."
Vineyard.destroy_all
GrapeVariety.destroy_all

puts "Creating vineyards and grape varieties..."

# Create Vineyards
bricco = Vineyard.create!(
  name: "Bricco Estate",
  location: "Bulgaria, Melnik Region",
  size: 20,
  age: 15,
  soil_type: "Schist",
  owner: "Viktor Emilov",
  season: "Autumn",
  irrigation: "Drip irrigation",
  weather: "Mediterranean climate"
)

florentina = Vineyard.create!(
  name: "Florentina Vineyard",
  location: "Hungary, Tokaj Region",
  size: 15,
  age: 25,
  soil_type: "Volcanic",
  owner: "Viktor Emilov",
  season: "Summer",
  irrigation: "Natural rainfall",
  weather: "Continental climate"
)

# Create Grape Varieties
GrapeVariety.create!(
  vineyard: bricco,
  grape_type: "Melnik 55",
  pesticides: "Organic control",
  care: "Hand-maintained",
  age: 10,
  sugar_level: 22.5,
  flavor_profile: "Full-bodied, rich tannins",
  planting_density: "2.0m x 1.0m",
  stage: "Veraison",
  irrigation: "Regulated deficit irrigation"
)

GrapeVariety.create!(
  vineyard: florentina,
  grape_type: "Furmint",
  pesticides: "Minimal intervention",
  care: "Traditional methods",
  age: 20,
  sugar_level: 24.0,
  flavor_profile: "Complex, honey notes",
  planting_density: "1.8m x 0.8m",
  stage: "Mature",
  irrigation: "Natural water table"
)

puts "Finished seeding database!"
