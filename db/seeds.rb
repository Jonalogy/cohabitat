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
Area.create(name: 'Novena', country_id: 1)
Area.create(name: 'Tanjong Pagar', country_id: 1)
Area.create(name: 'Raffles Place', country_id: 1)
Area.create(name: 'Tai Seng', country_id: 1)
Area.create(name: 'Fusionopolis', country_id: 1)
Area.create(name: 'Seattle', country_id: 2)
Area.create(name: 'Silicon Valley', country_id: 2)
Area.create(name: 'Manhattan', country_id: 2)
Area.create(name: 'Brooklyn', country_id: 2)

Vibe.create(name: 'Quiet')
Vibe.create(name: 'Vibrant')

Amenity.create(name: 'Coffee')
Amenity.create(name: 'Wi-Fi')
Amenity.create(name: 'Power socket')
Amenity.create(name: 'Restroom')
Amenity.create(name: 'Pantry')

# Vibe.create(name: 'Cozy')
# Vibe.create(name: 'Communal')
# Vibe.create(name: 'Homey')
# Vibe.create(name: 'Surfer')
# Vibe.create(name: 'Creative')

# SpaceType.create(name: 'Kids-friendly')
# SpaceType.create(name: 'Casual')
# SpaceType.create(name: 'Corporate')
# SpaceType.create(name: 'Hospitality-inspired')
# SpaceType.create(name: 'Startup')
# SpaceType.create(name: 'Smart-office')
# SpaceType.create(name: 'Design-oriented')
# SpaceType.create(name: 'Fitness-focused')
# SpaceType.create(name: 'Eco-friendly')

SpaceType.create(name: 'Finance')
SpaceType.create(name: 'Investment')
SpaceType.create(name: 'Accounting')
SpaceType.create(name: 'Art')
SpaceType.create(name: 'Technology')
SpaceType.create(name: 'Hospitality')
SpaceType.create(name: 'Health')
SpaceType.create(name: 'Creative')
SpaceType.create(name: 'Media')
SpaceType.create(name: 'Production')
