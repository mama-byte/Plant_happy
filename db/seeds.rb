# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Plant.destroy_all
Booking.destroy_all

les = User.create!(password: "lesFun", email: "les@fun.com")
serg = User.create!(password: "sergFun", email: "serg@fun.com")
planty = Plant.create!(name: "cactus", description:"This is a great cactus", user_id: les.id , care_instructions: "needs no water", price: 10, latitude: 52.532190, longitude:13.420540)
cacty = Plant.create!(name: "succulent", description:"This is a great succulent", user_id: les.id , care_instructions: "needs no water", price: 10, latitude: 52.5493, longitude:13.4137)
booky = Booking.create(start_date: Date.new(2020, 1, 1), end_date: Date.new(2020, 1, 2), user_id: serg.id, plant_id: planty.id)
wooky = Booking.create(start_date: Date.new(2020, 2, 2), end_date: Date.new(2020, 2, 20), user_id: serg.id, plant_id: cacty.id)
