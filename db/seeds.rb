# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Fetching seed'
Gear.destroy_all
User.create(email: 'lucasallesgomes@hotmail.com', password: '123456', first_name: 'Luca', last_name:'SALLES', address: 'ipanema', date_of_birth: Date.today, phone_number: '980497771')
luca = User.first
puts 'user created'
surf_board = Gear.new(sport_type: 'Surf', gear_type: 'board', description: "6'7", address: 'Hawaii', price: 20)
ski_gloves = Gear.new(sport_type: 'Ski', gear_type: 'gloves', description: 'G', address: 'France', price: 5)
parachutes = Gear.new(sport_type: 'Sky diving', gear_type: 'parachutes', description: 'New', address: 'Céu', price: 100)
surf_board.user = luca
ski_gloves.user = luca
parachutes.user = luca
surf_board.save
ski_gloves.save
parachutes.save
puts 'Created seed'
