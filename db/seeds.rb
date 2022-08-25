# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Fetching seed'
Gear.destroy_all
User.destroy_all
rafael = User.create!(email: 'rafaelnity@yahoo.com', password: '654321', first_name: 'Rafael', last_name:'GONCALVES', address: 'niteroi', date_of_birth: Date.today, phone_number: '980495551')
luca = User.create!(email: 'lucasallesgomes@hotmail.com', password: '123456', first_name: 'Luca', last_name:'SALLES', address: 'ipanema', date_of_birth: Date.today, phone_number: '980497771')
fabio = User.create!(email: 'fabio.simoesds@gmail.com', password: '123456', first_name: 'Fabio', last_name:'Santos', address: 'Barnstaple', date_of_birth: Date.today, phone_number: '980491231')
luca.save
puts 'user created'
surf_board = Gear.new(sport_type: 'Surfing', gear_type: 'Surfboard', description: "6'7 Surfboard with a wide now", address: 'Hawaii', price: 20, amount: 1)
ski_gloves = Gear.new(sport_type: 'Skiing', gear_type: 'Gloves', description: 'Very warm gloves with inside isulation', address: 'France', price: 5, amount: 1)
parachutes = Gear.new(sport_type: 'Sky diving', gear_type: 'Parachute', description: 'Brand new parachute, yellow bright color', address: 'France', price: 100, amount: 1)
parachutes_second = Gear.new(sport_type: 'Sky diving', gear_type: 'Parachute', description: "Brand new parachute, yellow bright color", address: 'Hawaii', price: 20, amount: 1)
surf_board_second = Gear.new(sport_type: 'Surfing', gear_type: 'Surfboard', description: "6'7 Surfboard with a wide now", address: 'France', price: 5, amount: 1)
ski_gloves_second = Gear.new(sport_type: 'Skiing', gear_type: 'Gloves', description: 'Very warm gloves with inside isulation', address: 'France', price: 100, amount: 1)
surf_wetsuit = Gear.new(sport_type: 'Surfing', gear_type: 'wetsuit', description: "4/3mm wetsuit in great condition Billabong", address: 'France', price: 5, amount: 1)
surf_wetsuit.user = fabio
surf_board.user = fabio
ski_gloves.user = rafael
parachutes.user = luca
surf_board_second.user = fabio
ski_gloves_second.user = rafael
parachutes_second.user = luca
surf_wetsuit.save
surf_board.save
ski_gloves.save
parachutes.save
surf_board_second.save
ski_gloves_second.save
parachutes_second.save
puts 'Creating bookings'
# booking_board = Booking.new(check_in: Date.new(2022, 8, 30), check_out: Date.new(2022, 9, 30))
# booking_board.user = rafael
# booking_board.gear = surf_board
# booking_board.save
# booking_gloves = Booking.new(check_in: Date.new(2022, 8, 29), check_out: Date.new(2022, 9, 3))
# booking_gloves.user = rafael
# booking_gloves.gear = ski_gloves
# booking_gloves.save
# booking_parachutes = Booking.new(check_in: Date.new(2022, 8, 29), check_out: Date.new(2022, 9, 3))
# booking_parachutes.user = fabio
# booking_parachutes.gear = parachutes
# booking_parachutes.save
puts 'Created seed'
