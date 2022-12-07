# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database"
Post.destroy_all
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
clement = User.new(first_name: "Clément", last_name: "Cordeiro", email: "clement@me.com", password:"123456")
clement.save!
olivier = User.new(first_name: "Olivier", last_name: "Kermoal", email: "olivier@me.com", password:"123456")
olivier.save!
gwendal = User.new(first_name: "Gwendal", last_name: "Le Bris", email: "gwendal@me.com", password:"123456")
gwendal.save!
quentin = User.new(first_name: "Quentin", last_name: "Orhant", email: "quentin@me.com", password:"123456")
quentin.save!
gaetan = User.new(first_name: "Gaetan", last_name: "Renault", email: "gaetan@me.com", password:"123456")
gaetan.save!
matthieu = User.new(first_name: "Matthieu", last_name: "Nourry", email: "matthieu@me.com", password:"123456")
matthieu.save!
lomig = User.new(first_name: "Lomig", last_name: "Enfroy", email: "lomig@me.com", password:"123456")
lomig.save!
guillaume = User.new(first_name: "Guillaume", last_name: "Messieux", email: "guillaume@me.com", password:"123456")
guillaume.save!

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

file_walter = File.open("db/fixtures/images/walter_teckel.jpeg")
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
dog_walter.photo.attach(io: file_walter, filename: ".jpeg", content_type: "image/jpeg")
dog_walter.save!
post = Post.create(content: "C'etait une trop belle journée avec #{dog_walter.name}", dog: dog_walter)
file_walter.close
file_walter = File.open("db/fixtures/images/walter_teckel.jpeg")
post.photo.attach(io: file_walter, filename: "#{dog_walter.name}.jpg", content_type: "image/jpg")
post.save!

file_hector = File.open("db/fixtures/images/hector_golden_retriever.jpg")
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
dog_hector.photo.attach(io: file_hector, filename: ".jpg", content_type: "image/jpg")
dog_hector.save!
post = Post.create(content: "C'etait une trop belle journée avec #{dog_hector.name}", dog: dog_hector)
file_hector.close
file_hector = File.open("db/fixtures/images/hector_golden_retriever.jpg")
post.photo.attach(io: file_hector, filename: "#{dog_hector.name}.jpg", content_type: "image/jpg")
post.save!

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

file = File.open("db/fixtures/images/colonel_border_terrier.jpg")
dog_colonel = Dog.new(name: "Colonel",
  breed: "Border Terrier",
  weight: 6.3,
  date_of_birth: Date.new(2020, 12, 19),
  personality: "J'ai mes têtes",
  gender: "Male",
  health: "Raplapla",
  neutered: false,
  user: matthieu
)
dog_colonel.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_colonel.save!

file = File.open("db/fixtures/images/norisk_husky.jpg")
dog_norisk = Dog.new(name: "Norisk",
  breed: "Husky de Sibérie",
  weight: 35,
  date_of_birth: Date.new(2018, 01, 9),
  personality: "Carrément timide",
  gender: "Femelle",
  health: "Sous traitement",
  neutered: true,
  user: olivier
)
dog_norisk.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_norisk.save!

file = File.open("db/fixtures/images/hulk_chihuahua.jpg")
dog_hulk = Dog.new(name: "Hulk",
  breed: "Chihuahua",
  weight: 2.5,
  date_of_birth: Date.new(2015, 02, 28),
  personality: "Faut pas me chercher",
  gender: "Male",
  health: "Sous traitement",
  neutered: true,
  user: gwendal
)
dog_hulk.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_hulk.save!

file = File.open("db/fixtures/images/sa_majesté_welsh.jpg")
dog_sa_majeste = Dog.new(name: "Sa majesté",
  breed: "Welsh Corgi",
  weight: 12,
  date_of_birth: Date.new(2019, 03, 25),
  personality: "Sympa avec tout le monde",
  gender: "Femelle",
  health: "Je pète la forme",
  neutered: true,
  user: lomig
)
dog_sa_majeste.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_sa_majeste.save!

file_sunny = File.open("db/fixtures/images/sunny_cocker.jpg")
dog_sunny = Dog.new(name: "Sunny",
  breed: "Cocker Spaniel",
  weight: 12,
  date_of_birth: Date.new(2019, 10, 10),
  personality: "Sympa avec tout le monde",
  gender: "Femelle",
  health: "Je pète la forme",
  neutered: true,
  user: clement
)
dog_sunny.photo.attach(io: file_sunny, filename: ".jpg", content_type: "image/jpg")
dog_sunny.save!
post = Post.create(content: "C'etait une trop belle journée avec #{dog_sunny.name}", dog: dog_sunny)
file_sunny.close
file_sunny = File.open("db/fixtures/images/sunny_cocker.jpg")
post.photo.attach(io: file_sunny, filename: "#{dog_sunny.name}.jpg", content_type: "image/jpg")
post.save!

file_pixel = File.open("db/fixtures/images/pixel_ckc.jpg")
dog_pixel = Dog.new(name: "Pixel",
  breed: "Cavalier King Charles",
  weight: 8.3,
  date_of_birth: Date.new(2015, 10, 11),
  personality: "Carrément timide",
  gender: "Femelle",
  health: "Je pète la forme",
  neutered: true,
  user: guillaume
)
dog_pixel.photo.attach(io: file_pixel, filename: ".jpg", content_type: "image/jpg")
dog_pixel.save!
post = Post.create(content: "C'etait une trop belle journée avec #{dog_pixel.name}", dog: dog_pixel)
file_pixel.close
file_pixel = File.open("db/fixtures/images/pixel_ckc.jpg")
post.photo.attach(io: file_pixel, filename: "#{dog_pixel.name}.jpg", content_type: "image/jpg")
post.save!

file_typhon = File.open("db/fixtures/images/typhon_staff.jpg")
dog_typhon = Dog.new(name: "Typhon",
  breed: "American Staffordshire Terrier",
  weight: 35.8,
  date_of_birth: Date.new(2021, 8, 1),
  personality: "Fou-fou",
  gender: "Male",
  health: "Je pète la forme",
  neutered: true,
  user: quentin
)
dog_typhon.photo.attach(io: file_typhon, filename: ".jpg", content_type: "image/jpg")
dog_typhon.save!
post = Post.create(content: "C'etait une trop belle journée avec #{dog_typhon.name}", dog: dog_typhon)
file_typhon.close
file_typhon = File.open("db/fixtures/images/typhon_staff.jpg")
post.photo.attach(io: file_typhon, filename: "#{dog_typhon.name}.jpg", content_type: "image/jpg")
post.save!

file = File.open("db/fixtures/images/rails_berger_allemand.jpg")
dog_rails = Dog.new(name: "Rails",
  breed: "Berger Allemand",
  weight: 32,
  date_of_birth: Date.new(2012, 6, 18),
  personality: "J'ai mes têtes",
  gender: "Male",
  health: "Raplapla",
  neutered: true,
  user: gaetan
)
dog_rails.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
dog_rails.save!

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

file = File.open("db/fixtures/images/shop_cereal.jpg")
spot_shop_cereal = Spot.new(
  name: "J'ai plus de croquettes",
  user: steven,
  description: "Boutique ouverte tous les jours de la semaine sauf le dimanche de
  9h à 12h et de 14h à 19h, les chiens sont les bienvenues!",
  address: "19 rue Claude de Bretagne, 56500 Locmine",
  spot_type: "Commerces"
)
spot_shop_cereal.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
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

file = File.open("db/fixtures/images/vet_cas_referes.jpg")
spot_vet_cas_referes = Spot.new(
  name: "Clinique vétérinaire Benjamin Franklin",
  user: aurelie,
  description: "Tout vétérinaire qui le souhaite peut nous confier un animal de sa patientelle afin que nous puissions
  intervenir en lui apportant notre aide technique et notre expérience. Notre activité exclusive en Chirurgie, en Imagerie,
  en Médecine interne et Cancérologie, en Dermatologie. Nous ne recevons donc pas de consultation en direct,
  de 2e avis, de consultation généraliste et nous ne vendons pas de médicaments ou d'aliments.",
  address: "38 rue du Danemark, 56400 AURAY",
  spot_type: "Vétérinaires",
  vet_specialty: "Cas référés"
)
spot_vet_cas_referes.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_vet_cas_referes.save!
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

  address: "10 Lann Vras, 56400 Plumergat",
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
  dog: dog_hector,
  date: Time.now
)
walk_1.save!

walk_2 = Walk.new(
  spot: spot_foret,
  dog: dog_hector,
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
review_shop_vrac_1 = Review.new(
  content: "C'est en plein centre ville! C'est très pratique,
  pas chère. C'est top",
  rating: 5,
  dog: dog_hector,
  spot: spot_shop_vrac
)
review_shop_vrac_1.save!

review_shop_vrac_2 = Review.new(
  content: "Je ne connaissais pas c'est pas mal",
  rating: 4,
  dog: dog_walter,
  spot: spot_shop_vrac
)
review_shop_vrac_2.save!

review_shop_vrac_3 = Review.new(
  content: "Y a pas de place pour se garer, la galère!",
  rating: 1,
  dog: dog_pixel,
  spot: spot_shop_vrac
)
review_shop_vrac_3.save!

review_shop_cereal_1 = Review.new(
  content: "Super croquette de très bonnes qualités à prix abordables. Je recommande",
  rating: 5,
  dog: dog_walter,
  spot: spot_shop_cereal
)
review_shop_cereal_1.save!

review_shop_cereal_2 = Review.new(
  content: "C'est pas mal en plus on peut se garer facilement",
  rating: 4,
  dog: dog_pixel,
  spot: spot_shop_cereal
)
review_shop_cereal_2.save!

review_shop_cereal_3 = Review.new(
  content: "Les croquettes sont de bonnes qualité mais il n'y a pas beaucoup de choix.",
  rating: 3,
  dog: dog_turbo,
  spot: spot_shop_cereal
)
review_shop_cereal_3.save!

review_shop_insect_1 = Review.new(
  content: "Turbo n'a jamais voulu les manger. Je vais reprendre des croquettes plus classiques...",
  rating: 1,
  dog: dog_turbo,
  spot: spot_shop_insects
)
review_shop_insect_1.save!

review_shop_insect_2 = Review.new(
  content: "Surprenant, je ne m'y attendais pas",
  rating: 3,
  dog: dog_pixel,
  spot: spot_shop_insects
)
review_shop_insect_2.save!

review_shop_insect_3 = Review.new(
  content: "Trop bien, et mon chien adore",
  rating: 4,
  dog: dog_walter,
  spot: spot_shop_insects
)
review_shop_insect_3.save!

review_vet_general_1 = Review.new(
  content: "Des professionnels qualifiés à l'écoute. Joignables facilement, prise de rdv rapide.",
  rating: 5,
  dog: dog_maika,
  spot: spot_vet_general
)
review_vet_general_1.save!

review_vet_general_2 = Review.new(
  content: "Top! en plus ils font les urgences!",
  rating: 5,
  dog: dog_walter,
  spot: spot_vet_general
)
review_vet_general_2.save!

review_vet_general_3 = Review.new(
  content: "Ils sont vraiment gentils, mais j'ai attendu un peu mon rdv!",
  rating: 3,
  dog: dog_pixel,
  spot: spot_vet_general
)
review_vet_general_3.save!

review_vet_osteo = Review.new(
  content: "Je recommande. Vétérinaire à l'écoute et agréable. Ma chienne remarche c'est un miracle!",
  rating: 5,
  dog: dog_hector,
  spot: spot_vet_general
)
review_vet_osteo.save!

review_vet_osteo_1 = Review.new(
  content: "Incroyable le travail que le Docteur fait. Je recommande",
  rating: 5,
  dog: dog_maika,
  spot: spot_vet_general
)
review_vet_osteo_1.save!

review_vet_osteo_2 = Review.new(
  content: "J'y croyais pas trop, et franchement c'est miraculeux les effets sur mon chien",
  rating: 4,
  dog: dog_pixel,
  spot: spot_vet_general
)
review_vet_osteo_2.save!

review_vet_cas_referes_1 = Review.new(
  content: "Très professionnel, c'est énorme comme structure!",
  rating: 4,
  dog: dog_maika,
  spot: spot_vet_cas_referes
)
review_vet_cas_referes_1.save!

review_vet_cas_referes_2 = Review.new(
  content: "Affreux c'est une usine à gaz, mais il n'y a que des professionnels",
  rating: 3,
  dog: dog_pixel,
  spot: spot_vet_cas_referes
)
review_vet_cas_referes_2.save!

review_vet_cas_referes_3 = Review.new(
  content: "Notre vétérinaire nous a envoyé là bas, ils sont vraiment compétents",
  rating: 5,
  dog: dog_hector,
  spot: spot_vet_cas_referes
)
review_vet_cas_referes_3.save!

review_pension_pro_bonheur = Review.new(
  content: "Très satisfait de l'accueil et de l'équipe. Je recommande.",
  rating: 5,
  dog: dog_walter,
  spot: spot_pension_pro_bonheur
)
review_pension_pro_bonheur.save!

review_pension_pro_bonheur_1 = Review.new(
  content: "Tout s'est bien passé pendant nos vacances.",
  rating: 4,
  dog: dog_typhon,
  spot: spot_pension_pro_bonheur
)
review_pension_pro_bonheur_1.save!

review_pension_pro_bonheur_2 = Review.new(
  content: "Bof, mais j'ai connu pire",
  rating: 2,
  dog: dog_pixel,
  spot: spot_pension_pro_bonheur
)
review_pension_pro_bonheur_2.save!

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

review_pension_particulier_linette_1 = Review.new(
  content: "Notre chien n'a pas été sorti du séjour, alors que c'était écrit qu'ils sortent",
  rating: 1,
  dog: dog_pixel,
  spot: spot_pension_linette
)
review_pension_particulier_linette_1.save!

review_pension_particulier_linette_2 = Review.new(
  content: "Je n'ai pas aimé, mon chien était tout triste",
  rating: 2,
  dog: dog_pixel,
  spot: spot_pension_linette
)
review_pension_particulier_linette_2.save!

review_grooming_happy = Review.new(
  content: "Très mal fait! l'épilation pour mon teckel était complètement raté.",
  rating: 1,
  dog: dog_walter,
  spot: spot_grooming_happy
)
review_grooming_happy.save!

review_grooming_happy_1 = Review.new(
  content: "Top tout s'est bien passé.",
  rating: 4,
  dog: dog_maika,
  spot: spot_grooming_happy
)
review_grooming_happy_1.save!

review_grooming_happy_2 = Review.new(
  content: "Bien, notre chienne était belle.",
  rating: 3,
  dog: dog_pixel,
  spot: spot_grooming_happy
)
review_grooming_happy_2.save!


review_grooming_cani = Review.new(
  content: "Très profesionnel, et sympa! Maika ressort encore plus belle que d'habitude!",
  rating: 5,
  dog: dog_maika,
  spot: spot_grooming_cani
)
review_grooming_cani.save!

review_grooming_cani_1 = Review.new(
  content: "Bonne première expérience",
  rating: 5,
  dog: dog_turbo,
  spot: spot_grooming_cani
)
review_grooming_cani_1.save!

review_grooming_cani_2 = Review.new(
  content: "C'était pas mal",
  rating: 4,
  dog: dog_hector,
  spot: spot_grooming_cani
)
review_grooming_cani_2.save!

file = File.open("db/fixtures/images/Maika_spot_foret.jpeg")
review_spot_foret = Review.new(
  content: "C'est super surtout pour les balades avec les copains",
  rating: 5,
  dog: dog_maika,
  spot: spot_foret
)
review_spot_foret.photo.attach(io: file, filename: ".jpeg", content_type: "image/jpeg")
review_spot_foret.save!

review_spot_foret_1 = Review.new(
  content: "C'est toujours sympa les balades en nature",
  rating: 5,
  dog: dog_hector,
  spot: spot_foret
)
review_spot_foret_1.save!

file = File.open("db/fixtures/images/typhon_spot_foret.jpg")
review_spot_foret_2 = Review.new(
  content: "C'est top pour que notre chien se défoule",
  rating: 5,
  dog: dog_typhon,
  spot: spot_foret
)
review_spot_foret_2.save!
review_spot_foret_2.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")


review_spot_plage = Review.new(
  content: "C'est cool d'avoir une plage où mon chien peut se baigner",
  rating: 5,
  dog: dog_hector,
  spot: spot_plage
)
review_spot_plage.save!

file = File.open("db/fixtures/images/pixel_spot_plage.jpg")
review_spot_plage_1 = Review.new(
  content: "Notre chienne adore cette plage",
  rating: 5,
  dog: dog_pixel,
  spot: spot_plage
)
review_spot_plage_1.save!
review_spot_plage_1.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")

review_spot_ville = Review.new(
  content: "Pas beaucoup de possibilité de balades, mais ça va",
  rating: 3,
  dog: dog_turbo,
  spot: spot_ville
)
review_spot_ville.save!

file = File.open("db/fixtures/images/sunny_spot_ville.jpg")
review_spot_ville_1 = Review.new(
  content: "C'est pas facile de se balader dans cette ville",
  rating: 2,
  dog: dog_sunny,
  spot: spot_ville
)
review_spot_ville_1.save!
review_spot_ville_1.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")

# 3 last spots for feed ------------------------------------------------------------------------------------------------
file = File.open("db/fixtures/images/broceliande.jpg")
spot_feed_1 = Spot.new(
  name: "Forêt de Brocéliande",
  user: steven,
  description: "Un lieu mystique où on y croiserait des Elfes et des lutins",
  address: "Forêt de Paimpont, 35380 Paimpont",
  spot_type: "Balades",
  walk_environment: "Forêt",
  walk_area: "Grands",
  walk_attendance: "Moyenne"
)
spot_feed_1.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_feed_1.save!
sleep 1

file = File.open("db/fixtures/images/bar_toutou.jpg")
spot_feed_2 = Spot.new(
  name: "Bar à toutou",
  user: steven,
  description: "Le nouveau bar à chien de Vannes, venez accompagné de votre compagnon preféré!",
  address: "6 Pl. de la Libération, 56000 Vannes",
  spot_type: "Commerces"
)
spot_feed_2.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
spot_feed_2.save!
sleep 1

file = File.open("db/fixtures/images/sunny_spot_ville.jpg")
review_spot_feed_1 = Review.new(
  content: "Super endroit pour se promener avec son chien, on a meme croisé un lutin!",
  rating: 4,
  dog: dog_sunny,
  spot: spot_feed_1
)
review_spot_feed_1.save!
review_spot_feed_1.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")

file = File.open("db/fixtures/images/walter_teckel.jpeg")
review_spot_ville_1 = Review.new(
  content: "Ce bar est top, j'y retournerai pour sûr !!",
  rating: 5,
  dog: dog_walter,
  spot: spot_feed_2
)
review_spot_ville_1.save!
review_spot_ville_1.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")

file = File.open("db/fixtures/images/sunny_spot_ville.jpg")
review_spot_feed_2 = Review.new(
  content: "Je n'ai pas apprécié mon experience car il y avait trop de monde, dommage",
  rating: 2,
  dog: dog_typhon,
  spot: spot_feed_2
)
review_spot_feed_2.save!
review_spot_feed_2.photo.attach(io: file, filename: ".jpg", content_type: "image/jpg")
# ----------------------------------------------------------------------------------------------------------------------
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

friendship_dog_pixel = Friendship.new(
  dog: dog_maika,
  buddy: dog_pixel,
  status: "pending"
)
friendship_dog_pixel.save!

friendship_dog_turbo = Friendship.new(
  dog: dog_maika,
  buddy: dog_typhon,
  status: "pending"
)
friendship_dog_turbo.save!

friendship_dog_sunny = Friendship.new(
  dog: dog_maika,
  buddy: dog_sunny,
  status: "pending"
)
friendship_dog_sunny.save!

# "Tic tac c'est l'heure de la promenade !"
# "N'oublie pas le comprimé de Maika !"
# "Tadam! Aujourd'hui Maika va chez le toiletteur!"
