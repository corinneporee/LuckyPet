# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
Dog.destroy_all
Spot.destroy_all
Invitation.destroy_all
Review.destroy_all
User.destroy_all
Walk.destroy_all


puts 'Creating dogs...'
Dog.create(
  name:"kiki",
  breed:"chihuahua",
  weight: 2.6,
  date_of_birth: 10/05/2010,
  personality: "exité",
  gender: "male",
  health: "super forme",
  neutered: true,
  user_id: "Katrina",
)
file = File.open("db/fixtures/images.jpg")
spot_foret = Spot.new(name: "PontSal",
                      user: "Rodolphe"
                      description: "magnifique forêt"
                      adress: "route de Pont Sal, 56400 MERIADEC"
      t.string :spot_type
      t.string :vet_specialty
      t.string :walk_environment
      t.string :walk_area
      t.string :walk_attendance
      t.boolean :shop_cereale
      t.boolean :shop_vrac
      t.boolean :shop_insects
      t.boolean :pension_pro
      t.boolean :pension_walks
      t.boolean :grooming_shop

puts 'Creating users...'
aurelie = User.new(first_name: "Aurélie", last_name: "Becques", email: "aurelie@me.com", password: "123456")
aurelie.save!
aurelie.photo.attach
rodolphe = User.new(first_name: "Rodolphe", last_name: "Junker", email: "rodolphe@me.com", password: "123456")
rodolphe.save!
steven = User.new(first_name: "Steven", last_name: "Dorion", email: "steven@me.com", password: "123456")
steven.save!
corinne = User.new(first_name: "Corinne", last_name: "Poree", email: "corinne@me.com", password: "123456")
corinne.save!
