# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create(name: 'Singapore')
Country.create(name: 'USA')
Area.create(name: 'Orchard', country_id: 1)
Area.create(name: 'Keong Saik', country_id: 1)
Area.create(name: 'Seattle', country_id: 2)
SpaceType.create(name: 'Creative')
SpaceType.create(name: 'Finance')
SpaceType.create(name: 'Technology')
Vibe.create(name: 'Quiet')
Vibe.create(name: 'Vibrant')
Amenity.create(name: 'Coffee')
Amenity.create(name: 'Wi-Fi')
Amenity.create(name: 'Power socket')
Amenity.create(name: 'Restroom')
Amenity.create(name: 'Pantry')
