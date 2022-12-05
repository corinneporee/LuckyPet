class Spot < ApplicationRecord
  SPOT_TYPES = ["Balades", "Commerces", "Vétérinaires", "Pensions", "Toiletteurs"]
  WALK_ENVIRONMENTS = ["Forêt", "Plage", "Ville"]
  WALK_AREA = ["Petite", "Moyenne", "Grands"]
  WALK_ATTENDANCE = ["Faible", "Moyenne", "Forte"]
  VET_SPECIALTIES = ["Généraliste", "Ostéopathe"]



  validates :walk_environment, inclusion: { in: WALK_ENVIRONMENTS, allow_blank: true }
  validates :walk_area, inclusion: { in: WALK_AREA, allow_blank: true }
  validates :walk_attendance, inclusion: { in: WALK_ATTENDANCE, allow_blank: true }
  validates :spot_type, presence: true, inclusion: { in: SPOT_TYPES }
  validates :vet_specialty, inclusion: { in: VET_SPECIALTIES, allow_blank: true }
  validates :pension_walks, inclusion: { in: [true, false], allow_blank: true }

  belongs_to :user
  has_many :walks
  has_many :reviews
  has_one_attached :photo

  validates :name, :adress, :spot_type, presence: true

  #validates :walk_environment, :walk_attendance, :walk_area, :shop_vrac, presence: true
  #validates :shop_cereale, :shop_insects, :pension_pro, :pension_walks, :grooming_shop, presence: true
  #validates :description, :walk_attendance, allow_blank: true
end
