# frozen_string_literal: true

# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password',
#                     password_confirmation: 'password')
# end

lg = Corporation.create(name: 'LG', founded: DateTime.new(1966, 2, 3),
                        founder: 'Koo In-hwoi',
                        revenue: 143, area_served: 'Worldwide', rating: 8)

samsung = Corporation.create(name: 'Samsung', founded: DateTime.new(1938, 3, 1),
                             founder: 'Lee Byung-chul',
                             revenue: 305, area_served: 'Worldwide', rating: 9)

apple = Corporation.create(name: 'Apple', founded: DateTime.new(1976, 4, 1),
                           founder: 'Steve Jobs',
                           revenue: 229.234, area_served: 'Worldwide', rating: 8)

first_lg_factory = lg.factories.create(name: 'Main LG factory', location: 'China')
second_lg_factory = lg.factories.create(name: 'Secondary LG factory', location: 'USA')

first_sam_factory = samsung.factories.create(name: 'SamFac', location: 'China')
second_sam_factory = samsung.factories.create(name: 'FacSamsung', location: 'Poland')

first_apple_factory = apple.factories.create(name: 'FoxCon', location: 'China')
second_apple_factory = apple.factories.create(name: 'Apple Corp Factory', location: 'USA')

iphone_x = apple.items.create(item_type: 'Electronics', model: 'Iphon X', price: 1500)

lg_tv60 = lg.items.create(item_type: 'Electronics', model: "LG 60'", price: 999)

galaxy_s8 = samsung.items.create(item_type: 'Electronics', model: 'Galaxy S8', price: 1000)

lg_workshop = first_lg_factory.workshops.create(name: 'Main workshop')
lg_workshop_sec = second_lg_factory.workshops.create(name: 'Secondary workshop')

sam_workshop = first_sam_factory.workshops.create(name: 'Main workshop')
sam_workshop_sec = second_sam_factory.workshops.create(name: 'Secondary workshop')

apple_workshop = first_apple_factory.workshops.create(name: 'Main workshop')
apple_workshop_sec = second_apple_factory.workshops.create(name: 'Secondary workshop')

first_lg_factory.create_principal(email: 'principal@1.com', password: 123123, name: 'John')