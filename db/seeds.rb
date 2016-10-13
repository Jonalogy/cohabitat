# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: 'admin@email.com', encrypted_password: '$2a$10$dz1sDDkyQjK2U95GYV7VzeHQzqM8Zj66Xfgpm3vfQE55WHotAsI2q')
User.create(email: 'user1@email.com', encrypted_password: '$2a$10$VBXVmohP.MJPQ0L2cDX61eGKR.ek6MXC7VPV5gMyfP5Qtq.DR3N3u')
User.create(email: 'user2@email.com', encrypted_password: '$2a$10$jhGxha7dQKgMIpgWn/dtI./y6jfnQ5CCw/tDuBBGrDrb6ua.EQDcO')
User.create(email: 'user3@email.com', encrypted_password: '$2a$10$u1Y.r4cXXLpAKahcSAFM5eu4ibndqE0fedRBqeWmY5NzzL1ECVykq')
User.create(email: 'user4@email.com', encrypted_password: '$2a$10$Tg/mYzEGHnYr3hN.ls/JD.wJcVqTYO1deSMirWxDHhnnH.aZAiuyG')
User.create(email: 'user5@email.com', encrypted_password: '$2a$10$rhwvrZHkabTYG.2X5N2qBuWl1rzLqz1OY6fgCxBqbwbToKhpUu4RG')


Country.create(name: 'Singapore')
Country.create(name: 'USA')
Area.create(name: 'Orchard', country_id: 1)
Area.create(name: 'Keong Saik', country_id: 1)
Area.create(name: 'Novena', country_id: 1)
Area.create(name: 'Tanjong Pagar', country_id: 1)
Area.create(name: 'Raffles Place', country_id: 1)
Area.create(name: 'Tai Seng', country_id: 1)
Area.create(name: 'Seattle', country_id: 2)
Area.create(name: 'Silicon Valley', country_id: 2)
Area.create(name: 'Manhattan', country_id: 2)
Area.create(name: 'Brooklyn', country_id: 2)
Area.create(name: 'Buona Vista', country_id: 1)
Area.create(name: 'Marina Area', country_id: 1)
Area.create(name: 'Alexandra', country_id: 1)
Area.create(name: 'Tiong Bahru', country_id: 1)
Area.create(name: 'East Coast', country_id: 1)
Area.create(name: 'Holland', country_id: 1)
Area.create(name: 'Bugis', country_id: 1)
Area.create(name: 'Keppel Area', country_id: 1)
Area.create(name: 'Changi', country_id: 1)
Area.create(name: 'Thomson', country_id: 1)

Address.create(name: '1 George St')
Address.create(name: '20 Kallang Ave Level 10 Pico Creative Centre')
Address.create(name: '40A Orchard Road #05-01 The MacDonald House')
Address.create(name: '318C King George Avenue, King George Building')
Address.create(name: '120 Robinson Road #15-01')
Address.create(name: '6 Raffles Quay #16-01')
Address.create(name: '71 Robinson Rd, #07-01')
Address.create(name: '3 Fusionopolis Way, #10-21 Symbiosis')
Address.create(name: 'No. 8 Temasek Boulevard Suntec Tower 3 #06-02')
Address.create(name: 'Temasek Boulevard #40-01, Suntec Tower 2')
Address.create(name: '8 Marina Boulevard #15-02 Marina Bay Financial Centre Tower 1')
Address.create(name: '31 Exeter Road Comcentre #01-00')
Address.create(name: '40A Orchard Road, 09-01 The MacDonald House')
Address.create(name: '3 Temasek Avenue #18-01 Centennial Tower')
Address.create(name: '123 East Coast Road')
Address.create(name: '30 Pasir Panjang Road, #03-32 Mapletree Business City, Mapletree Business City')
Address.create(name: '1 Fusionopolis Place #17-10 Galaxis')
Address.create(name: '#04-01B Delta House, 2 Alexandra Road')
Address.create(name: '8 Marina Boulevard #05-02 Marina Bay Financial Centre')
Address.create(name: '62 Ubi Road 1 Oxley Bizhub 2 Unit 03-17')
Address.create(name: '11 Yong Siak St')
Address.create(name: '19 Carpenter Street, #05-01')
Address.create(name: '21 Media Circle #07-01')
Address.create(name: '991C Alexandra Rd')
Address.create(name: '38 Beach Road #22-00 South Beach Tower')
Address.create(name: 'Level 29, Marina Bay Financial Centre Tower 2, 10 Marina Boulevard')
Address.create(name: 'One George Street #10-01')
Address.create(name: 'Claymore Connect 442 Orchard Road, #03-01')
Address.create(name: '391B Orchard Road #23-01 Ngee Ann City Tower B')
Address.create(name: '8 Claymore Hill')
Address.create(name: 'Blk 71 Ayer Rajah Crescent #03-14')
Address.create(name: '38 Beach Road, 13-11 South Beach Tower')
Address.create(name: '8 Cross Street, #26-01 PWC Building')
Address.create(name: '158 Cecil Street, #03-01')
Address.create(name: '42B Boat Quay')
Address.create(name: 'One Raffles Place Office Tower 2, #34-61')
Address.create(name: 'CapitaGreen, 138 Market Street, Level 20')
Address.create(name: '158 Cecil Street #14-01')
Address.create(name: '1 Fusionopolis Link #03-01 Nexus@One North')
Address.create(name: 'Scotts Square #03-11/12/13 6 Scotts Road')

Postal.create(name: '018981')
Postal.create(name: '038988')
Postal.create(name: '038989')
Postal.create(name: '039190')
Postal.create(name: '048580')
Postal.create(name: '048616')
Postal.create(name: '048424')
Postal.create(name: '048946')
Postal.create(name: '049145')
Postal.create(name: '049831')
Postal.create(name: '059908')
Postal.create(name: '068895')
Postal.create(name: '068913')
Postal.create(name: '069545')
Postal.create(name: '089543')
Postal.create(name: '089543')
Postal.create(name: '138633')
Postal.create(name: '117440')
Postal.create(name: '119971')
Postal.create(name: '138522')
Postal.create(name: '138542')
Postal.create(name: '138562')
Postal.create(name: '139951')
Postal.create(name: '159919')
Postal.create(name: '168646')
Postal.create(name: '189673')
Postal.create(name: '189767')
Postal.create(name: '208563')
Postal.create(name: '228209')
Postal.create(name: '229572')
Postal.create(name: '238838')
Postal.create(name: '238874')
Postal.create(name: '239730')
Postal.create(name: '339411')
Postal.create(name: '408734')
Postal.create(name: '993032')

Space_name.create(name: 'Adobe')
Space_name.create(name: 'AirBnb')
Space_name.create(name: 'Autodesk')
Space_name.create(name: 'Art Social Haus')
Space_name.create(name: 'Carousell')
Space_name.create(name: 'DDB')
Space_name.create(name: 'Diageo')
Space_name.create(name: 'Facebook')
Space_name.create(name: 'Fox')
Space_name.create(name: 'Garena')
Space_name.create(name: 'Google')
Space_name.create(name: 'Honestbee')
Space_name.create(name: 'Infinite Framework')
Space_name.create(name: 'Just Co')
Space_name.create(name: 'K+')
Space_name.create(name: 'Lego')
Space_name.create(name: 'lepak1corner')
Space_name.create(name: 'Linkedin')
Space_name.create(name: 'Makespace')
Space_name.create(name: 'McCANN Group')
Space_name.create(name: 'McKinsey')
Space_name.create(name: 'Netflix')
Space_name.create(name: 'Ogilvy & Mather')
Space_name.create(name: 'R/GA')
Space_name.create(name: 'SAP')
Space_name.create(name: 'Salesforce')
Space_name.create(name: 'SapientNitro')
Space_name.create(name: 'Sparkk Space')
Space_name.create(name: 'Spencer Ogden')
Space_name.create(name: 'Singtel')
Space_name.create(name: 'Spotify')
Space_name.create(name: 'TBWA')
Space_name.create(name: 'The Co')
Space_name.create(name: 'The Great Room')
Space_name.create(name: 'Trehaus')
Space_name.create(name: 'Tripadvisor')
Space_name.create(name: 'True Yoga')
Space_name.create(name: 'Twitter')
Space_name.create(name: 'ubSuite')
Space_name.create(name: 'Woolf Works')

Space_description.create(name: 'a co-working space where art and design creatives can freely mingle, interact and work separately as a like-minded community')
Space_description.create(name: 'space for the media and broadcast professional. Large space which include studio and edit suites')
Space_description.create(name: '18 meeting rooms of which 13 are decorated with the likeness of home. eclectic decor')
Space_description.create(name: '22,000 sq ft office houses, high-tech social media centre. big social pantry bar')
Space_description.create(name: 'Astroturf flooring, reclaimed wood round tables, and American-style diners')
Space_description.create(name: 'Open-concept office space features adjustable standing desks and chill-out areas with bean bags')
Space_description.create(name: 'Garden terrace decked with vertical greenery and hanging foliage, the garden terraces, which can be used for casual meetings and events. Feature an in-built bar area. green design with calming effect')
Space_description.create(name: '6,000 sq ft. playground concept office. This is the place where it would make you want to travel more')
Space_description.create(name: 'A space where you can be a child again. There are breakout areas and miniature amphitheatres for large scale presentation')
Space_description.create(name: 'Young and startup environment. Pet friendly')
Space_description.create(name: 'corporate office in the heart of orchard road. fitness and health focused environment with access to gym facilities')
Space_description.create(name: 'Premiere service office in the heart of Orchard Road')
Space_description.create(name: 'Singapore’s first co-working space complete with child-friendly learning facilities. Private offices, semi-private dedicated desk or co-work space')
Space_description.create(name: 'Tech company with inhouse gym, Ritual')
Space_description.create(name: 'Ideal place for creative marketers to thrive. Technologically advanced communities')
Space_description.create(name: 'Creative and inspiring workspace, industrial design')
Space_description.create(name: 'Cosy workspace')
Space_description.create(name: 'State of the art studio and filming facilities in the media hub of singapore')
Space_description.create(name: 'A co-working space dedicated to women')
Space_description.create(name: 'Independent co-working art space, where members are granted 24 hour access to the studio and events areas')
Space_description.create(name: 'open industrial studio-loft concept catered for emerging creatives')
Space_description.create(name: 'One of the most enviable office space by people who wish to work in every global city. The interior design reflects the local community of Singapore')
Space_description.create(name: '12,000 sq foot office. open-concept industrial-themed office space')
Space_description.create(name: 'Total space of 7,500 sqm. Perks include massage room, sleeping pods and an entertainment corner')
Space_description.create(name: 'features cosy corners, or sitting rooms, with swing-like seats suspended from the ceiling, foot-reflexology path and sleeping pods')
Space_description.create(name: 'A cosy co-working space near the beach')
Space_description.create(name: 'Clean and sleek design for the corporate executives')
Space_description.create(name: 'high-tech and professional workspace')
Space_description.create(name: 'High tech communication office')
Space_description.create(name: 'one of the best media office in Singapore ')
Space_description.create(name: 'collaborative environment')
Space_description.create(name: 'creative feel')
Space_description.create(name: 'advance and high-tech work space')
Space_description.create(name: 'creative and trendy')
Space_description.create(name: 'cafe design workspace')
Space_description.create(name: 'open concept')
Space_description.create(name: 'inspiring corporate environment')
Space_description.create(name: 'corporate setting with bar')
Space_description.create(name: 'a co-sharing for the arts community')

Vibe.create(name: 'Quiet')
Vibe.create(name: 'Vibrant'

Amenity.create(name: 'Coffee')
Amenity.create(name: 'Conference Room')
Amenity.create(name: 'Lounge')
Amenity.create(name: 'Meeting Room')
Amenity.create(name: 'Pantry')
Amenity.create(name: 'Power socket')
Amenity.create(name: 'Recreation Room')
Amenity.create(name: 'Restroom')
Amenity.create(name: 'Wi-Fi')



# SpaceType.create(name: 'Kids-friendly')
# SpaceType.create(name: 'Casual')
# SpaceType.create(name: 'Corporate')
# SpaceType.create(name: 'Hospitality-inspired')
# SpaceType.create(name: 'Startup')
# SpaceType.create(name: 'Smart-office')
# SpaceType.create(name: 'Design-oriented')
# SpaceType.create(name: 'Fitness-focused')
# SpaceType.create(name: 'Eco-friendly')
# SpaceType.create(name: 'Technology')
# SpaceType.create(name: 'Shophouse')


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
