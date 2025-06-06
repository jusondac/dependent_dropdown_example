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
Location.destroy_all
City.destroy_all
Province.destroy_all
Country.destroy_all

# Create countries
usa = Country.create!(name: "United States")
canada = Country.create!(name: "Canada")
uk = Country.create!(name: "United Kingdom")

# Create provinces/states for USA
california = usa.provinces.create!(name: "California")
texas = usa.provinces.create!(name: "Texas")
new_york = usa.provinces.create!(name: "New York")

# Create provinces for Canada
ontario = canada.provinces.create!(name: "Ontario")
quebec = canada.provinces.create!(name: "Quebec")
british_columbia = canada.provinces.create!(name: "British Columbia")

# Create counties for UK
england = uk.provinces.create!(name: "England")
scotland = uk.provinces.create!(name: "Scotland")
wales = uk.provinces.create!(name: "Wales")

# Create cities for California
california.cities.create!([
  { name: "Los Angeles" },
  { name: "San Francisco" },
  { name: "San Diego" },
  { name: "Sacramento" }
])

# Create cities for Texas
texas.cities.create!([
  { name: "Houston" },
  { name: "Dallas" },
  { name: "Austin" },
  { name: "San Antonio" }
])

# Create cities for New York
new_york.cities.create!([
  { name: "New York City" },
  { name: "Buffalo" },
  { name: "Albany" },
  { name: "Rochester" }
])

# Create cities for Ontario
ontario.cities.create!([
  { name: "Toronto" },
  { name: "Ottawa" },
  { name: "Hamilton" },
  { name: "London" }
])

# Create cities for Quebec
quebec.cities.create!([
  { name: "Montreal" },
  { name: "Quebec City" },
  { name: "Laval" },
  { name: "Gatineau" }
])

# Create cities for British Columbia
british_columbia.cities.create!([
  { name: "Vancouver" },
  { name: "Victoria" },
  { name: "Surrey" },
  { name: "Burnaby" }
])

# Create cities for England
england.cities.create!([
  { name: "London" },
  { name: "Manchester" },
  { name: "Birmingham" },
  { name: "Liverpool" }
])

# Create cities for Scotland
scotland.cities.create!([
  { name: "Edinburgh" },
  { name: "Glasgow" },
  { name: "Aberdeen" },
  { name: "Dundee" }
])

# Create cities for Wales
wales.cities.create!([
  { name: "Cardiff" },
  { name: "Swansea" },
  { name: "Newport" },
  { name: "Bangor" }
])

puts "Seeded #{Country.count} countries, #{Province.count} provinces, and #{City.count} cities"
