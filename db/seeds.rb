# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Raffles Place

Space.create(user_id:7, country_id:1, area_id:5, address:'42B Boat Quay', postal:'139951', space_name: 'Spotify', space_description: 'high-tech and professional workspace', space_type_id:6, vibe_id:1)
Space.create(user_id:2, country_id:1, area_id:5, address:'1 George St', postal:'238749', space_name: 'Diageo', space_description: 'corporate setting with bar', space_type_id:12, vibe_id:1)
Space.create(user_id:3, country_id:1, area_id:5, address:'8 Cross Street, #26-01 PWC Building', postal:'374743', space_name: 'Tripadvisor', space_description: '6,000 sq ft. playground concept office. This is the place where it would make you want to travel more', space_type_id:6, vibe_id:1)
Space.create(user_id:4, country_id:1, area_id:5, address:'158 Cecil Street #14-01', postal:'002239', space_name: 'Twitter', space_description: '22,000 sq ft office houses, high-tech social media centre. big social pantry bar', space_type_id:6, vibe_id:1)
Space.create(user_id:5, country_id:1, area_id:5, address:'6 Raffles Quay #16-01', postal:'783222', space_name: 'McKinsey', space_description: 'Clean and sleek design for the corporate executives', space_type_id:3, vibe_id:2)
Space.create(user_id:6, country_id:1, area_id:5, address:'120 Robinson Road #15-01', postal:'975332', space_name: 'Ogilvy & Mather', space_description: 'creative and trendy', space_type_id:9, vibe_id:1)
Space.create(user_id:7, country_id:1, area_id:5, address:'158 Cecil Street, #03-01', postal:'098432', space_name: 'AirBnb', space_description: '18 meeting rooms of which 13 are decorated with the likeness of home. eclectic decor', space_type_id:6, vibe_id:1)


# Marina Area
Space.create(user_id:2, country_id:1, area_id:12, address:'No. 8 Temasek Boulevard Suntec Tower 3 #06-02', postal:'393923', space_name: 'Netflix', space_description: 'one of the best media office in Singapore', space_type_id:10, vibe_id:1)
Space.create(user_id:3, country_id:1, area_id:12, address:'Temasek Boulevard #40-01, Suntec Tower 2', postal:'435454', space_name: 'LinkedIn', space_description: 'Tech company with inhouse gym, Ritual', space_type_id:6, vibe_id:1)
Space.create(user_id:4, country_id:1, area_id:12, address:'8 Marina Boulevard #15-02 Marina Bay Financial Centre Tower 1', postal:'565434', space_name: 'Facebook', space_description: 'One of the most enviable office space by people who wish to work in every global city. The interior design reflects the local community of Singapore', space_type_id:6, vibe_id:1)
Space.create(user_id:5, country_id:1, area_id:12, address:'3 Temasek Avenue #18-01 Centennial Tower', postal:'644322', space_name: 'Google', space_description: 'Ideal place for creative marketers to thrive. Technologically advanced communities', space_type_id:6, vibe_id:1)
Space.create(user_id:6, country_id:1, area_id:12, address:'8 Marina Boulevard #05-02 Marina Bay Financial Centre', postal:'005442', space_name: 'The Great Room', space_description: 'Hospitality-inspired coworking space', space_type_id:7, vibe_id:2)
Space.create(user_id:7, country_id:1, area_id:12, address:'Level 29, Marina Bay Financial Centre Tower 2, 10 Marina Boulevard', postal:'454342', space_name: 'Adobe', space_description: 'open concept', space_type_id:6, vibe_id:1)
Space.create(user_id:2, country_id:1, area_id:12, address:'38 Beach Road, 11 South Beach Tower, #11-01', postal:'655022', space_name: 'Autodesk', space_description: 'advance and high-tech work space', space_type_id:11, vibe_id:2)
Space.create(user_id:3, country_id:1, area_id:12, address:'38 Beach Road, 13-11 South Beach Tower, #03-01', postal:'655022', space_name: 'Lego', space_description: 'A space where you can be a child again. There are breakout areas and miniature amphitheatres for large scale presentation', space_type_id:9, vibe_id:2)


# Orchard
Space.create(user_id:4, country_id:1, area_id:21, address:'40A Orchard Road #05-01 The MacDonald House', postal:'934234', space_name: 'McCANN Group', space_description: 'Creative and inspiring workspace, industrial design', space_type_id:10, vibe_id:1)
Space.create(user_id:5, country_id:1, area_id:21, address:'40A Orchard Road, 09-01 The MacDonald House', postal:'934234', space_name: 'R/GA', space_description: 'creative and trendy', space_type_id:6, vibe_id:1)
Space.create(user_id:6, country_id:1, area_id:21, address:'31 Exeter Road Comcentre #01-00', postal:'642999', space_name: 'Singtel', space_description: 'High tech communication office', space_type_id:6, vibe_id:1)
Space.create(user_id:7, country_id:1, area_id:21, address:'Claymore Connect 442 Orchard Road, #03-01', postal:'678423', space_name: 'Trehaus', space_description: 'Singapore’s first co-working space complete with child-friendly learning facilities. Private offices, semi-private dedicated desk or co-work space', space_type_id:6, vibe_id:1)
Space.create(user_id:2, country_id:1, area_id:21, address:'8 Claymore Hill', postal:'984330', space_name: 'True Yoga', space_description: 'corporate office in the heart of orchard road. fitness and health focused environment with access to gym facilities', space_type_id:7, vibe_id:2)
Space.create(user_id:3, country_id:1, area_id:21, address:'Scotts Square #03-11/12/13 6 Scotts Road', postal:'758394', space_name: 'SAP', space_description: 'Total space of 7,500 sqm. Perks include massage room, sleeping pods and an entertainment corner', space_type_id:6, vibe_id:1)
Space.create(user_id:4, country_id:1, area_id:21, address:'391B Orchard Road #23-01 Ngee Ann City Tower B', postal:'583943', space_name: 'Salesforce', space_description: 'inspiring corporate environment', space_type_id:11, vibe_id:2)
Space.create(user_id:5, country_id:1, area_id:21, address:'391B Orchard Road #03-09 Ngee Ann City Tower A', postal:'583943', space_name: 'SapientNitro', space_description: 'features cosy corners, or sitting rooms, with swing-like seats suspended from the ceiling, foot-reflexology path and sleeping pods', space_type_id:9, vibe_id:2)



# # Buona Vista
# Space_name.create(name: 'Art Social Haus')
# Space_name.create(name: 'Carousell')
# Space_name.create(name: 'DDB')
# Space_name.create(name: 'Fox')
# Space_name.create(name: 'Garena')
# Space_name.create(name: 'Honestbee')
# Space_name.create(name: 'Infinite Framework')
# Space_name.create(name: 'Just Co')
# Space_name.create(name: 'K+')
# Space_name.create(name: 'lepak1corner')
# Space_name.create(name: 'Makespace')
# Space_name.create(name: 'Sparkk Space')
# Space_name.create(name: 'Spencer Ogden')
# Space_name.create(name: 'TBWA')
# Space_name.create(name: 'The Co')
# Space_name.create(name: 'ubSuite')
# Space_name.create(name: 'Woolf Works')
#
#
# Country.create(name: 'Singapore')
# Country.create(name: 'USA')
# Area.create(name: 'Orchard', country_id: 1)
# Area.create(name: 'Keong Saik', country_id: 1)
# Area.create(name: 'Novena', country_id: 1)
# Area.create(name: 'Tanjong Pagar', country_id: 1)
# Area.create(name: 'Raffles Place', country_id: 1)
# Area.create(name: 'Tai Seng', country_id: 1)
# Area.create(name: 'Seattle', country_id: 2)
# Area.create(name: 'Silicon Valley', country_id: 2)
# Area.create(name: 'Manhattan', country_id: 2)
# Area.create(name: 'Brooklyn', country_id: 2)
# Area.create(name: 'Buona Vista', country_id: 1)
# Area.create(name: 'Marina Area', country_id: 1)
# Area.create(name: 'Alexandra', country_id: 1)
# Area.create(name: 'Tiong Bahru', country_id: 1)
# Area.create(name: 'East Coast', country_id: 1)
# Area.create(name: 'Holland', country_id: 1)
# Area.create(name: 'Bugis', country_id: 1)
# Area.create(name: 'Keppel Area', country_id: 1)
# Area.create(name: 'Changi', country_id: 1)
# Area.create(name: 'Thomson', country_id: 1)
#
# SpaceAddress.create(name: '20 Kallang Ave Level 10 Pico Creative Centre')
# SpaceAddress.create(name: '318C King George Avenue, King George Building')
# SpaceAddress.create(name: '3 Fusionopolis Way, #10-21 Symbiosis')
# SpaceAddress.create(name: '123 East Coast Road')
# SpaceAddress.create(name: '30 Pasir Panjang Road, #03-32 Mapletree Business City, Mapletree Business City')
# SpaceAddress.create(name: '1 Fusionopolis Place #17-10 Galaxis')
# SpaceAddress.create(name: '#04-01B Delta House, 2 Alexandra Road')
# SpaceAddress.create(name: '62 Ubi Road 1 Oxley Bizhub 2 Unit 03-17')
# SpaceAddress.create(name: '11 Yong Siak St')
# SpaceAddress.create(name: '19 Carpenter Street, #05-01')
# SpaceAddress.create(name: '21 Media Circle #07-01')
# SpaceAddress.create(name: '991C Alexandra Rd')
# SpaceAddress.create(name: 'Blk 71 Ayer Rajah Crescent #03-14')
# SpaceAddress.create(name: 'CapitaGreen, 138 Market Street, Level 20')
# SpaceAddress.create(name: '1 Fusionopolis Link #03-01 Nexus@One North')
#

# #
# # Space_description.create(name: 'a co-working space where art and design creatives can freely mingle, interact and work separately as a like-minded community')
# # Space_description.create(name: 'space for the media and broadcast professional. Large space which include studio and edit suites')
# # Space_description.create(name: 'Astroturf flooring, reclaimed wood round tables, and American-style diners')
# # Space_description.create(name: 'Open-concept office space features adjustable standing desks and chill-out areas with bean bags')
# # Space_description.create(name: 'Garden terrace decked with vertical greenery and hanging foliage, the garden terraces, which can be used for casual meetings and events. Feature an in-built bar area. green design with calming effect')

# # Space_description.create(name: 'Young and startup environment. Pet friendly')
# # Space_description.create(name: 'State of the art studio and filming facilities in the media hub of singapore')
# # Space_description.create(name: 'A co-working space dedicated to women')
# # Space_description.create(name: 'Independent co-working art space, where members are granted 24 hour access to the studio and events areas')
# # Space_description.create(name: 'open industrial studio-loft concept catered for emerging creatives')
# # Space_description.create(name: '12,000 sq foot office. open-concept industrial-themed office space')

# # Space_description.create(name: 'A cosy co-working space near the beach')
# # Space_description.create(name: 'cafe design workspace')
# # Space_description.create(name: 'a co-sharing for the arts community')
#
# # Vibe.create(name: 'Quiet')
# # Vibe.create(name: 'Vibrant')
# #
# # Amenity.create(name: 'Coffee')
# # Amenity.create(name: 'Conference Room')
# # Amenity.create(name: 'Lounge')
# # Amenity.create(name: 'Meeting Room')
# # Amenity.create(name: 'Pantry')
# # Amenity.create(name: 'Recreation Room')
# # Amenity.create(name: 'Restroom')
# # Amenity.create(name: 'Wi-Fi')


# # SpaceType.create(name: 'Finance')
# # SpaceType.create(name: 'Investment')
# # SpaceType.create(name: 'Accounting')
# # SpaceType.create(name: 'Art')
# # SpaceType.create(name: 'Technology')
# # SpaceType.create(name: 'Hospitality')
# # SpaceType.create(name: 'Health')
# # SpaceType.create(name: 'Creative')
# # SpaceType.create(name: 'Media')
# # SpaceType.create(name: 'Production')
#
