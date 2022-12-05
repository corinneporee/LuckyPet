# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
Friendship.destroy_all
Dog.destroy_all
Spot.destroy_all
Walk.destroy_all
Review.destroy_all
User.destroy_all


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
file = File.open("db/fixtures/images/maika_croise.jpeg")
dog_maika = Dog.new(name: "Maika",
  breed: "Croisé",
  weight: 54,
  date_of_birth: Date.new(2016, 11, 25),
  personality: "Sympa avec tout le monde",
  gender: "Femelle",
  health: "Je pète la forme",
  neutered: true,
  user: aurelie
)
dog_maika.photo.attach(io: file, filename: ".jpeg", content_type: "image/jpeg")
dog_maika.save!

file = File.open("db/fixtures/images/walter_teckel.jpeg")
dog_walter = Dog.new(name: "Walter",
  breed: "Teckel",
  weight: 4,
  date_of_birth: Date.new(2017, 9, 3),
  personality: "Sympa avec tout le monde",
  gender: "Male",
  health: "Sous traitement",
  neutered: false,
  user: rodolphe
)
dog_walter.photo.attach(io: file, filename: ".jpeg", content_type: "image/jpeg")
dog_walter.save!

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
  user: steven
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
  address: "10 Liderff, 56400 Plougoumelen",
  spot_type: "Balades",
  walk_environment: "Forêt",
  walk_area: "Grands",
  walk_attendance: "Moyenne"
)
spot_foret.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_foret.save!
sleep 1

file = File.open("db/fixtures/images/plage_plouharnel.jpg")
spot_plage = Spot.new(
  name: "Plage le Mané Guen",
  user: corinne,
  description: "Magnifique plage pour marcher et se baigner. Pas trop de courant.
               Les chiens sont acceptés hors saisons",
  address: "10 Liderff, 56400 Plougoumelen",
  spot_type: "Balades",
  walk_environment: "Plage",
  walk_area: "Grands",
  walk_attendance: "Moyenne"
)
spot_plage.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_plage.save!
sleep 1

file = File.open("db/fixtures/images/ville_vannes.jpg")
spot_ville = Spot.new(
  name: "Les Remparts de Vannes",
  user: steven,
  description: "Belle endroit de balade le long des remparts. Les chiens doivent être tenus en laisse.",
  address: "4 rue des vierges, 56000 Vannes",
  spot_type: "Balades",
  walk_environment: "Ville",
  walk_area: "Moyenne",
  walk_attendance: "Moyenne"
)
spot_ville.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_ville.save!
sleep 1

file = File.open("db/fixtures/images/shop_cereal.png")
spot_shop_cereal = Spot.new(
  name: "J'ai plus de croquettes",
  user: steven,
  description: "Boutique ouverte tous les jours de la semaine sauf le dimanche de
  9h à 12h et de 14h à 19h, les chiens sont les bienvenues!",
  address: "19 rue Claude de Bretagne, 56500 Locmine",
  spot_type: "Commerces"
)
spot_shop_cereal.photo.attach(io: file, filename: ".png", content_type: "image/png")
spot_shop_cereal.save!
sleep 1

file = File.open("db/fixtures/images/shop_vrac.jpg")
spot_shop_vrac = Spot.new(
  name: "Le bar à croquette",
  user: corinne,
  description: "Notre boutique met à disposition des distributeurs de croquettes de toutes sortes.
  C'est en libre service, mais nous restons à votre disposition pour des conseils. Ouvert du lundi au vendredi de
  9h à 18h.",
  address: "10 rue Carnot, 56000 Pontivy",
  spot_type: "Commerces"
)
spot_shop_vrac.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_shop_vrac.save!
sleep 1

file = File.open("db/fixtures/images/shop_insect.jpeg")
spot_shop_insects = Spot.new(
  name: "Passion animal",
  user: aurelie,
  description: "Nous vendons des croquettes de la marque 'Tomojo' spécialisé dans les croquettes à base d'insectes.
  La boutique est ouverte tous les jours du lundi au samedi de 10h à 18h non stop. Nos amis les chiens sont les bienvenus.",
  address: "Zone industrielle Du Prat, 2 avenue Gontran Bienvenu, 56000 Vannes",
  spot_type: "Commerces"
)
spot_shop_insects.photo.attach(io: file, filename: ".jpeg", content_type: "image/jpeg")
spot_shop_insects.save!
sleep 1

file = File.open("db/fixtures/images/vet_general.jpg")
spot_vet_general = Spot.new(
  name: "Cabinet Levert Vétérinaire Associés",
  user: aurelie,
  description: "Cabinet vétérinaire, ouvert du lundi au samedi de 9h à 20h, consultations uniquement sur rdv.",
  address: "3 rue des Ecoles, 56400 Auray",
  spot_type: "Vétérinaires",
  vet_specialty: "Généraliste"
)
spot_vet_general.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_vet_general.save!
sleep 1

file = File.open("db/fixtures/images/vet_osteo.png")
spot_vet_osteo = Spot.new(
  name: "Osteovet56",
  user: aurelie,
  description: "Séances d'ostéopathies uniquement sur rdv.",
  address: "8 rue les Vents du Sud, 56000 Vannes",
  spot_type: "Vétérinaires",
  vet_specialty: "Ostéopathe"
)
spot_vet_osteo.photo.attach(io: file, filename: ".png", content_type: "image/png")
spot_vet_osteo.save!
sleep 1

file = File.open("db/fixtures/images/pension_pro_bonheur.jpg")
spot_pension_pro_bonheur = Spot.new(
  name: "Le Bonheur des 4 pattes",
  user: rodolphe,
  description: "Structure de 1000m2, pas très loin de la ville. Ouverte de 9h à 12h et de 14h à 18h. Vous pouvez venir visiter notre
  pension uniquement sur rdv.",
  address: "14 route de Mériadec, Le Bois des Mûriers, 56000 Ploeren",
  spot_type: "Pensions",
  pension_pro: true,
  pension_walks: true
  )
spot_pension_pro_bonheur.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_pension_pro_bonheur.save!
sleep 1

file = File.open("db/fixtures/images/pension_pro_fox.jpg")
spot_pension_pro_fox = Spot.new(
  name: "Fox Trotte",
  user: steven,
  description: "Notre domaine est installé sur un parc boisé de plus de 5000m2.
  Vous pouvez nous contacter du lundi au samedi de 9h à 18h.",
  address: "Parc de la Lande, 56250 Elven",
  spot_type: "Pensions",
  pension_pro: true,
  pension_walks: false
)
spot_pension_pro_fox.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_pension_pro_fox.save!
sleep 1

file = File.open("db/fixtures/images/pension_particulier_linette.jpg")
spot_pension_linette = Spot.new(
  name: "Chez Linette",
  user: aurelie,
  description: "Pension familiale. Vous pouvez me contacter du lundi au samedi de 9h à 18h.",

  adress: "10 Lann Vras, 56400 Plumergat",
  spot_type: "Pensions",
  pension_walks: true

)
spot_pension_linette.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_pension_linette.save!
sleep 1

file = File.open("db/fixtures/images/pension_particulier_animar.png")
spot_pension_animar = Spot.new(
  name: "Animar",
  user: rodolphe,
  description: "Pension familiale acceptant jusqu'à 5 chiens. Me contacter pour avoir
  plus de renseignements",

  address: "4 bis rue de la Forge, 56400 Plumergat",
  spot_type: "Pensions",
  pension_walks: true

)
spot_pension_animar.photo.attach(io: file, filename: ".png", content_type: "image/png")
spot_pension_animar.save!
sleep 1

file = File.open("db/fixtures/images/grooming_happy.jpg")
spot_grooming_happy = Spot.new(
  name: "Happy Dog",
  user: rodolphe,
  description: "Salon ouvert du lundi au samedi de 9h à 12h puis de 14h à 18h,
  uniquement sur rdv",
  address: "15 avenue Wilson, 56400 Auray",
  spot_type: "Toiletteurs"
)
spot_grooming_happy.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_grooming_happy.save!
sleep 1

file = File.open("db/fixtures/images/grooming_cani.jpg")
spot_grooming_cani = Spot.new(
  name: "Cani couaf",
  user: aurelie,
  description: "Salon de toilettage 'ambulant'. Lundi: Auray sur la place du marché, Mardi: Vannes, porte StVincent,
  Mercredi: Grand champ: place de la mairie, Jeudi:Plescop, parking les 3 soleils, Vendredi: Séné, zone du Poulfanc rue Alsace.
  Vous pouvez me contacter pour une prise de rdv",
  address: "10 bis rue Joseph le Brix, 56890 Saint-Avé",
  spot_type: "Toiletteurs"
)
spot_grooming_cani.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_grooming_cani.save!
sleep 1

puts 'Walks'
walk_1 = Walk.new(
  spot: spot_plage,
  dog: dog_walter,
  date: Time.now
)
walk_1.save!

walk_2 = Walk.new(
  spot: spot_foret,
  dog: dog_walter,
  date: Time.now
)
walk_2.save!

walk_3 = Walk.new(
  spot: spot_ville,
  dog: dog_turbo,
  date: Time.now
)
walk_3.save!

puts 'Invitations'
invitation = Invitation.new(
  dog: dog_maika,
  walk: walk_1,
  message: "Hello ça te dit une balade avec moi aujourd'hui?",
  status: "pending"
)
invitation.save!

puts 'Reviews'
review_shop_vrac = Review.new(
  content: "C'est en plein centre ville! C'est très pratique,
  pas chère. C'est top",
  rating: 5,
  dog: dog_hector,
  spot: spot_shop_vrac
)
review_shop_vrac.save!

review_shop_cereal = Review.new(
  content: "Super croquette de très bonnes qualités à prix abordables. Je recommande",
  rating: 3,
  dog: dog_walter,
  spot: spot_shop_cereal
)
review_shop_cereal.save!

review_shop_insect = Review.new(
  content: "Turbo n'a jamais voulu les manger. Je vais reprendre des croquettes plus classiques...",
  rating: 1,
  dog: dog_turbo,
  spot: spot_shop_insects
)
review_shop_insect.save!

review_vet_general = Review.new(
  content: "Des professionnels qualifiés à l'écoute. Joignables facilement, prise de rdv rapide.",
  rating: 5,
  dog: dog_maika,
  spot: spot_vet_general
)
review_vet_general.save!

review_vet_osteo = Review.new(
  content: "Je recommande. Vétérinaire à l'écoute et agréable. Ma chienne remarche c'est un miracle!",
  rating: 5,
  dog: dog_hector,
  spot: spot_vet_general
)
review_vet_osteo.save!

review_pension_pro_bonheur = Review.new(
  content: "Très satisfait de l'accueil et de l'équipe. Je recommande.",
  rating: 5,
  dog: dog_walter,
  spot: spot_pension_pro_bonheur
)
review_pension_pro_bonheur.save!

review_pension_pro_fox = Review.new(
  content: "A fuir. Les personnes ne sont pas du tout professionnelles.",
  rating: 1,
  dog: dog_turbo,
  spot: spot_pension_pro_fox
)
review_pension_pro_fox.save!

review_pension_particulier_linette = Review.new(
  content: " Mon chien n'a pas été bien traité, il est revenu avec plein de blessures.",
  rating: 1,
  dog: dog_maika,
  spot: spot_pension_linette
)
review_pension_particulier_linette.save!

review_grooming_happy = Review.new(
  content: "Très mal fait! l'épilation pour mon teckel était complètement raté.",
  rating: 1,
  dog: dog_walter,
  spot: spot_grooming_happy
)
review_grooming_happy.save!

review_grooming_cani = Review.new(
  content: "Très profesionnel, et sympa! Kiki ressort encore plus beau que d'habitude!",
  rating: 5,
  dog: dog_maika,
  spot: spot_grooming_cani
)
review_grooming_cani.save!

review_spot_foret = Review.new(
  content: "C'est super surtout pour les balades avec les copains",
  rating: 5,
  dog: dog_maika,
  spot: spot_foret
)
review_spot_foret.save!

review_spot_plage = Review.new(
  content: "C'est cool d'avoir une plage où mon chien peut se baigner",
  rating: 5,
  dog: dog_hector,
  spot: spot_plage
)
review_spot_plage.save!

review_spot_ville = Review.new(
  content: "C'est cool d'avoir une plage où mon chien peut se baigner",
  rating: 5,
  dog: dog_turbo,
  spot: spot_ville
)
review_spot_ville.save!

puts 'Friendships'
friendship_dog_walter = Friendship.new(
  dog: dog_maika,
  buddy: dog_walter,
  status: "pending"
)
friendship_dog_walter.save!

friendship_dog_hector = Friendship.new(
  dog: dog_maika,
  buddy: dog_hector,
  status: "pending"
)
friendship_dog_hector.save!
