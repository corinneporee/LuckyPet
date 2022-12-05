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

  validates :name, :address, :spot_type, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # validates :walk_environment, :walk_attendance, :walk_area, :shop_vrac, presence: true
  # validates :shop_cereale, :shop_insects, :pension_pro, :pension_walks, :grooming_shop, presence: true
  # validates :description, :walk_attendance, allow_blank: true

  def rating
    ratings = self.reviews.map(&:rating)
    rating = ratings.size.zero? ? 0 : ratings.sum / ratings.size.to_f

    return rating
  end
end
