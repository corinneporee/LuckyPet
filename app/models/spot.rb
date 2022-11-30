class Spot < ApplicationRecord
  belongs_to :user
  has_many :walks
  has_many :reviews

  validates :name, :adress, :spot_type, :vet_specialty, presence: true
  validates :walk_environment, :walk_size, :walk_area, :shop_vrac, presence: true
  validates :shop_cereale, :shop_insects, :pension_pro, :pension_walks, :grooming_shop, presence: true
  validates :description, :walk_attendance, allow_blank: true
end
