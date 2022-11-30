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

puts 'Creating users...'
aurelie = User.new(first_name: "Aurélie", last_name: "Becques", email: "aurelie@me.com", password: "123456")
aurelie.save!
rodolphe = User.new(first_name: "Rodolphe", last_name: "Junker", email: "rodolphe@me.com", password: "123456")
rodolphe.save!
steven = User.new(first_name: "Steven", last_name: "Dorion", email: "steven@me.com", password: "123456")
steven.save!
corinne = User.new(first_name: "Corinne", last_name: "Poree", email: "corinne@me.com", password: "123456")
corinne.save!

puts 'Creating dogs..'
file = File.open("db/fixtures/images/kiki_chihuahua.jpg")
dog_kiki = Dog.new(name: "Kiki",
  breed: "Chihuahua",
  weight: 2.6,
  date_of_birth: Date.new(2020, 5, 12),
  personality: "Carrément timide",
  gender: "Male",
  health: "Je pète la forme",
  neutered: true,
  user: aurelie
)
dog_kiki.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_kiki.save!

file = File.open("db/fixtures/images/pepette_teckel.jpg")
dog_pepette = Dog.new(name: "Pépette",
  breed: "Teckel",
  weight: 4.5,
  date_of_birth: Date.new(2018, 9, 24),
  personality: "Sympa avec tout le monde",
  gender: "Femelle",
  health: "Sous traitement",
  neutered: true,
  user: rodolphe
)
dog_pepette.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_pepette.save!

file = File.open("db/fixtures/images/hector_golden_retriever.jpg")
dog_hector = Dog.new(name: "Hector",
  breed: "Golden Retriever",
  weight: 35,
  date_of_birth: Date.new(2014,3, 17),
  personality: "J'ai mes têtes",
  gender: "Male",
  health: "Raplapla",
  neutered: true,
  user: corinne
)
dog_hector.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_hector.save!

file = File.open("db/fixtures/images/turbo_berger_australien.jpg")
dog_turbo = Dog.new(name: "Turbo",
  breed: "Berger Australien",
  weight: 8.2,
  date_of_birth: Date.new(2022, 6, 17),
  personality: "Fou-fou",
  gender: "Femelle",
  health: "Je pète la forme",
  neutered: true,
  user: steven,
)
dog_turbo.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_turbo.save!


puts 'Creating spots..'

file = File.open("db/fixtures/images/foret_pont_sal.jpg")
spot_foret = Spot.new(
  name: "Foret de Pont Sal",
  user: corinne,
  description: "Joli coin à découvrir, Belle forêt avec sentiers,
                balade de 4km. Les chiens peuvent être sans laisse,
                rivière du Bono permettant les baignades",
  adress: "10 Liderff, 56400 Plougoumelen",
  spot_type: "Balades",
  walk_environment: "Forêt",
  walk_area: "Grands",
  walk_attendance: "Moyenne"
)
spot_foret.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_foret.save!

file = File.open("db/fixtures/images/plage_plouharnel.jpg")
spot_plage = Spot.new(
  name: "Plage le Mané Guen",
  user: corinne,
  description: "Magnifique plage pour marcher et se baigner. Pas trop de courant.
               Les chiens sont acceptés hors saisons",
  adress: "10 Liderff, 56400 Plougoumelen",
  spot_type: "Balades",
  walk_environment: "Plage",
  walk_area: "Grands",
  walk_attendance: "Moyenne"
)
spot_plage.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_plage.save!

      #t.boolean :shop_cereale
      #t.boolean :shop_vrac
      #t.boolean :shop_insects
      #t.boolean :pension_pro
      #t.boolean :pension_walks
      #t.boolean :grooming_shop
      #t.string :vet_specialty

puts 'Invitations' #est-ce qu'on ferait pas apparaître les photos entre les 2 chiens ?
# Invitation.create(# y a pas de name pour l'invitation? genre:"kiki invite pépette",
#   message: "Hello ça te dit une balade avec moi aujourd'hui?",
#   status: "pending"
  # user ou dog?
# )


  # t.bigint "dog_id", null: false est-ce que le userID il apparaît?
  # t.bigint "walk_id", null: false


puts 'Reviews'
# Review.create!(
#   content: "Super balade, super endroit, j'ai rencontré des copains et en même temps pas trop de monde, super spot!",
#   rating: 5
# dog
# spot
# )



puts 'Walks'
# mettre une photo
# walk_1 = Walk.new(
  # spot: spot_foret,
  # dog: dog_kiki,
  #date: 12.12.2022,
# )
# walk_1.save!
